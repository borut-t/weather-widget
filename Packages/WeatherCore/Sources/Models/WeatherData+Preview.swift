//
//  File.swift
//  WeatherCore
//
//  Created by Borut Tomazin on 25/11/2025.
//

import Foundation

public extension WeatherData {
  static let preview: WeatherData = WeatherData(
    temperature: 68,
    condition: "Partly Cloudy",
    symbolName: "cloud.sun.fill",
    humidity: 0.65,
    windSpeed: 12,
    locationName: "San Francisco",
    lastUpdated: Date()
  )
}
