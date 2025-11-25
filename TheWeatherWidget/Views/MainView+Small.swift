//
//  MainView+Small.swift
//  TheWeatherWidget
//
//  Created by Borut Tomazin on 25/11/2025.
//

import SwiftUI
import WeatherCore

extension MainView {
  struct SmallWidgetView: View {
    var entry: WeatherEntry
    
    var body: some View {
      VStack(spacing: 6) {
        Image(systemName: entry.weatherData.symbolName)
          .font(.system(size: 28))
          .foregroundStyle(.blue)
        
        Text(entry.weatherData.temperatureString)
          .font(.system(size: 22, weight: .bold))
          .foregroundStyle(.primary)
        
        Text(entry.weatherData.locationName)
          .font(.caption2)
          .foregroundStyle(.secondary)
        
        VStack(spacing: 2) {
          Text(entry.weatherData.condition)
            .font(.caption2)
            .foregroundStyle(.secondary)
            .lineLimit(1)
          
          if entry.configuration.showHumidity {
            Text(entry.weatherData.humidityString)
              .font(.caption2)
              .foregroundStyle(.secondary)
          }
        }
      }
      .padding(.vertical, 8)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
  }
}
