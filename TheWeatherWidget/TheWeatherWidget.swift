//
//  TheWeatherWidget.swift
//  TheWeatherWidget
//
//  Created by Borut Tomazin on 25/11/2025.
//

import WidgetKit
import SwiftUI
import WeatherCore

struct TheWeatherWidget: Widget {
  let kind: String = "TheWeatherWidget"

  var body: some WidgetConfiguration {
    AppIntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: TimelineProvider()) { entry in
      MainView(entry: entry)
    }
    .configurationDisplayName("The Weather")
    .description("Stay updated with current weather conditions.")
    .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
  }
}

#Preview(as: .systemSmall) {
  TheWeatherWidget()
} timeline: {
  WeatherEntry(date: .now, weatherData: .preview, hourlyForecast: HourlyWeather.preview, configuration: .basic)
}

#Preview(as: .systemMedium) {
  TheWeatherWidget()
} timeline: {
  WeatherEntry(date: .now, weatherData: .preview, hourlyForecast: HourlyWeather.preview, configuration: .basic)
}

#Preview(as: .systemLarge) {
  TheWeatherWidget()
} timeline: {
  WeatherEntry(date: .now, weatherData: .preview, hourlyForecast: HourlyWeather.preview, configuration: .extended)
}
