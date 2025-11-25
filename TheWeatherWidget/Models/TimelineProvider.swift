//
//  TimelineProvider.swift
//  TheWeatherWidget
//
//  Created by Borut Tomazin on 25/11/2025.
//

import Foundation
import WidgetKit
import WeatherCore
import WeatherKit
import PovioKitCore

struct TimelineProvider: AppIntentTimelineProvider {
  func placeholder(in context: Context) -> WeatherEntry {
    WeatherEntry(date: Date(), weatherData: .preview, hourlyForecast: HourlyWeather.preview, configuration: ConfigurationIntent())
  }
  
  func snapshot(for configuration: ConfigurationIntent, in context: Context) async -> WeatherEntry {
    WeatherEntry(date: Date(), weatherData: .preview, hourlyForecast: HourlyWeather.preview, configuration: configuration)
  }
  
  func timeline(for configuration: ConfigurationIntent, in context: Context) async -> Timeline<WeatherEntry> {
    do {
      let weatherData = try await WeatherService.shared.fetchCurrentWeather()
      
      // fetch real hourly forecast data from WeatherKit
      let rawHourlyForecast = try await WeatherService.shared.fetchHourlyForecast()
      let hourlyForecast = rawHourlyForecast.map { hourWeather in
        HourlyWeather(
          date: hourWeather.date,
          temperature: hourWeather.temperature.value,
          symbolName: hourWeather.symbolName
        )
      }
      
      let entry = WeatherEntry(date: Date(), weatherData: weatherData, hourlyForecast: Array(hourlyForecast), configuration: configuration)
      
      // update every 15 minutes
      let nextUpdate = Calendar.current.date(byAdding: .minute, value: 15, to: Date())!
      return Timeline(entries: [entry], policy: .after(nextUpdate))
    } catch {
      // fallback to preview data if weather fetch fails
      Logger.error("Failed to fetch weather data", params: ["error": error.localizedDescription])
      let entry = WeatherEntry(date: Date(), weatherData: .preview, hourlyForecast: HourlyWeather.preview, configuration: configuration)
      let nextUpdate = Calendar.current.date(byAdding: .minute, value: 15, to: Date())!
      return Timeline(entries: [entry], policy: .after(nextUpdate))
    }
  }
}
