//
//  WeatherEntry.swift
//  TheWeatherWidget
//
//  Created by Borut Tomazin on 25/11/2025.
//

import Foundation
import WidgetKit
import WeatherCore

struct WeatherEntry: TimelineEntry {
  let date: Date
  let weatherData: WeatherData
  let hourlyForecast: [HourlyWeather]
  let configuration: ConfigurationIntent
}
