//
//  WeatherData.swift
//  WeatherCore
//
//  Created by Borut Tomazin on 25/11/2025.
//

import Foundation

public struct WeatherData {
  public let temperature: Double
  public let condition: String
  public let symbolName: String
  public let humidity: Double
  public let windSpeed: Double
  public let locationName: String
  public let lastUpdated: Date
}

public extension WeatherData {
  var temperatureString: String {
    String(format: "%.0f°", temperature)
  }
  
  var humidityString: String {
    String(format: "%.0f%%", humidity * 100)
  }
  
  var windSpeedString: String {
    String(format: "%.0f mph", windSpeed)
  }
}
