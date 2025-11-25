//
//  ConfigurationIntent.swift
//  TheWeatherWidget
//
//  Created by Borut Tomazin on 25/11/2025.
//

import WidgetKit
import AppIntents

struct ConfigurationIntent: WidgetConfigurationIntent {
  static var title: LocalizedStringResource { "Configuration" }
  static var description: IntentDescription { "Configure your weather widget." }
  
  @Parameter(title: "Show Humidity", default: true)
  var showHumidity: Bool

  @Parameter(title: "Show Wind", default: true)
  var showWind: Bool

  @Parameter(title: "Show Hourly Forecast", default: true)
  var showHourlyForecast: Bool
}

extension ConfigurationIntent {
  static var basic: ConfigurationIntent {
    let intent = ConfigurationIntent()
    intent.showHumidity = false
    intent.showWind = false
    intent.showHourlyForecast = false
    return intent
  }

  static var extended: ConfigurationIntent {
    let intent = ConfigurationIntent()
    intent.showHumidity = true
    intent.showWind = true
    intent.showHourlyForecast = true
    return intent
  }
}
