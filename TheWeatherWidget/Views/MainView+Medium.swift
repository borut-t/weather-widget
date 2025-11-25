//
//  MainView+Medium.swift
//  TheWeatherWidget
//
//  Created by Borut Tomazin on 25/11/2025.
//

import SwiftUI
import WeatherCore

extension MainView {
  struct MediumWidgetView: View {
    var entry: WeatherEntry
    
    var body: some View {
      HStack(spacing: 16) {
        leftSide
        rightSide
        
        Spacer()
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 12)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
  }
}

// MARK: - View Builders
extension MainView.MediumWidgetView {
  var leftSide: some View {
    VStack(spacing: 8) {
      Image(systemName: entry.weatherData.symbolName)
        .font(.system(size: 40))
        .foregroundStyle(.blue)
      
      Text(entry.weatherData.temperatureString)
        .font(.system(size: 28, weight: .bold))
        .foregroundStyle(.primary)
    }
  }
  
  var rightSide: some View {
    VStack(alignment: .leading, spacing: 6) {
      Text(entry.weatherData.locationName)
        .font(.headline)
        .foregroundStyle(.primary)
      
      Text(entry.weatherData.condition)
        .font(.subheadline)
        .foregroundStyle(.secondary)
        .lineLimit(2)
      
      HStack(spacing: 20) {
        if entry.configuration.showHumidity {
          HStack(spacing: 4) {
            Image(systemName: "humidity")
              .font(.caption)
              .foregroundStyle(.secondary)
            Text(entry.weatherData.humidityString)
              .font(.caption)
              .foregroundStyle(.secondary)
          }
          if entry.configuration.showWind {
            HStack(spacing: 4) {
              Image(systemName: "wind")
                .font(.caption)
                .foregroundStyle(.secondary)
              Text(entry.weatherData.windSpeedString)
                .font(.caption)
                .foregroundStyle(.secondary)
            }
          }
        }
      }
    }
  }
}
