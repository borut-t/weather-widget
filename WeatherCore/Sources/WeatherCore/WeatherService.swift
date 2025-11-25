//
//  WeatherService.swift
//  WeatherCore
//
//  Created by Borut Tomazin on 25/11/2025.
//

import Foundation
import WeatherKit
import CoreLocation
import Dependencies

typealias WeatherKitService = WeatherService

public class WeatherService {
    private let weatherKitService = WeatherKit.WeatherService()
    private let location: CLLocation
    private let locationName: String

    public init(
        location: CLLocation = CLLocation(latitude: 37.7749, longitude: -122.4194),
        locationName: String = "San Francisco"
    ) {
        self.location = location
        self.locationName = locationName
    }

    public func fetchCurrentWeather() async throws -> WeatherData {
        let weather = try await weatherKitService.weather(for: location)
        let current = weather.currentWeather

        return WeatherData(
            temperature: current.temperature.value,
            condition: current.condition.description,
            symbolName: current.symbolName,
            humidity: current.humidity,
            windSpeed: current.wind.speed.value,
            locationName: locationName,
            lastUpdated: Date()
        )
    }

    public func fetchHourlyForecast() async throws -> [HourWeather] {
        let weather = try await weatherKitService.weather(for: location)
        return Array(weather.hourlyForecast.prefix(24)) // Next 24 hours
    }

    public func fetchDailyForecast() async throws -> [DayWeather] {
        let weather = try await weatherKitService.weather(for: location)
        return Array(weather.dailyForecast.prefix(7)) // Next 7 days
    }
}

// MARK: - Dependency Injection
extension DependencyValues {
    public var weatherService: WeatherService {
        get { self[WeatherService.self] }
        set { self[WeatherService.self] = newValue }
    }
}

extension WeatherService: DependencyKey {
    public static let liveValue = WeatherService()
}
