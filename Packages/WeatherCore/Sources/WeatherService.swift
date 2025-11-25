//
//  WeatherService.swift
//  WeatherCore
//
//  Created by Borut Tomazin on 25/11/2025.
//

import Foundation
import WeatherKit
import CoreLocation

public class WeatherService {
  public static let shared = WeatherService()
  private let weatherKitService = WeatherKit.WeatherService()
  
  // SF coordinates
  private let sanFranciscoLocation = CLLocation(
    latitude: 37.7749,
    longitude: -122.4194
  )
  
  private init() {}
  
  public func fetchCurrentWeather() async throws -> WeatherData {
    let weather = try await weatherKitService.weather(for: sanFranciscoLocation)
    let current = weather.currentWeather
    
    return WeatherData(
      temperature: current.temperature.value,
      condition: current.condition.description,
      symbolName: current.symbolName,
      humidity: current.humidity,
      windSpeed: current.wind.speed.value,
      locationName: "San Francisco",
      lastUpdated: Date()
    )
  }
  
  public func fetchHourlyForecast() async throws -> [HourWeather] {
    let weather = try await weatherKitService.weather(for: sanFranciscoLocation)
    return Array(weather.hourlyForecast.prefix(24)) // Next 24 hours
  }
  
  public func fetchDailyForecast() async throws -> [DayWeather] {
    let weather = try await weatherKitService.weather(for: sanFranciscoLocation)
    return Array(weather.dailyForecast.prefix(7)) // Next 7 days
  }
}
