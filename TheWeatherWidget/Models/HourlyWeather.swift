//
//  HourlyWeather.swift
//  TheWeatherWidget
//
//  Created by Borut Tomazin on 25/11/2025.
//

import Foundation

struct HourlyWeather: Identifiable {
  let id = UUID()
  let date: Date
  let temperature: Double
  let symbolName: String

  var temperatureString: String {
    String(format: "%.0f°", temperature)
  }

  var hourString: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "ha"
    return formatter.string(from: date)
  }

  static let preview: [HourlyWeather] = [
    HourlyWeather(date: Date(), temperature: 68, symbolName: "sun.max.fill"),
    HourlyWeather(date: Date().addingTimeInterval(3600), temperature: 72, symbolName: "cloud.sun.fill"),
    HourlyWeather(date: Date().addingTimeInterval(7200), temperature: 75, symbolName: "cloud.fill"),
    HourlyWeather(date: Date().addingTimeInterval(10800), temperature: 70, symbolName: "cloud.sun.fill"),
    HourlyWeather(date: Date().addingTimeInterval(14400), temperature: 68, symbolName: "sun.max.fill")
  ]
}
