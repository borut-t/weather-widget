//
//  MainView+Large.swift
//  TheWeatherWidget
//
//  Created by Borut Tomazin on 25/11/2025.
//

import SwiftUI
import WeatherCore

extension MainView {
  struct LargeWidgetView: View {
    var entry: WeatherEntry
    
    var body: some View {
      VStack(spacing: 16) {
        header
        
        Text(entry.weatherData.temperatureString)
          .font(.system(size: 48, weight: .bold))
          .foregroundStyle(.primary)
          .frame(maxWidth: .infinity, alignment: .leading)
        
        details
        
        Spacer()
      }
      .padding(20)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
  }
}

// MARK: - View Builders
private extension MainView.LargeWidgetView {
  var header: some View {
    HStack {
      VStack(alignment: .leading, spacing: 4) {
        Text(entry.weatherData.locationName)
          .font(.title2)
          .foregroundStyle(.primary)
        
        Text(entry.weatherData.condition)
          .font(.title3)
          .foregroundStyle(.secondary)
      }
      
      Spacer()
      
      Image(systemName: entry.weatherData.symbolName)
        .font(.system(size: 48))
        .foregroundStyle(.blue)
    }
  }
  
  var details: some View {
    VStack(spacing: 24) {
      HStack(spacing: 24) {
        if entry.configuration.showHumidity {
          VStack(spacing: 4) {
            Image(systemName: "humidity")
              .font(.title3)
              .foregroundStyle(.secondary)
            Text(entry.weatherData.humidityString)
              .font(.subheadline)
              .foregroundStyle(.primary)
            Text("Humidity")
              .font(.caption)
              .foregroundStyle(.secondary)
          }
        }
        
        Spacer()
        
        if entry.configuration.showWind {
          VStack(spacing: 4) {
            Image(systemName: "wind")
              .font(.title3)
              .foregroundStyle(.secondary)
            Text(entry.weatherData.windSpeedString)
              .font(.subheadline)
              .foregroundStyle(.primary)
            Text("Wind")
              .font(.caption)
              .foregroundStyle(.secondary)
          }
        }
      }
      
      if entry.configuration.showHourlyForecast {
        VStack(alignment: .leading, spacing: 8) {
          Text("Next Hours")
            .font(.caption)
            .bold()
            .foregroundStyle(.secondary)
          
          HStack(spacing: 12) {
            ForEach(entry.hourlyForecast.prefix(7)) { hour in
              VStack(spacing: 4) {
                Text(hour.hourString)
                  .font(.caption2)
                  .foregroundStyle(.secondary)
                  .frame(height: 16)
                
                Image(systemName: hour.symbolName)
                  .font(.title3)
                  .foregroundStyle(.primary)
                  .frame(height: 15)
                
                Text(hour.temperatureString)
                  .font(.caption)
                  .foregroundStyle(.primary)
              }
            }
            Spacer()
          }
        }
      }
    }
  }
}
