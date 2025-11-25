//
//  MainView.swift
//  TheWeatherWidget
//
//  Created by Borut Tomazin on 25/11/2025.
//

import SwiftUI
import WidgetKit

struct MainView: View {
  var entry: WeatherEntry
  @Environment(\.widgetFamily) var family
  
  var body: some View {
    Group {
      switch family {
      case .systemSmall:
        SmallWidgetView(entry: entry)
      case .systemMedium:
        MediumWidgetView(entry: entry)
      case .systemLarge:
        LargeWidgetView(entry: entry)
      default:
        SmallWidgetView(entry: entry)
      }
    }
    .containerBackground(.fill.tertiary, for: .widget)
  }
}
