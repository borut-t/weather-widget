//
//  ContentView.swift
//  TheWeather
//
//  Created by Borut Tomazin on 25/11/2025.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Spacer()
      Image(systemName: "sun.snow")
        .font(.system(size: 100))
        .foregroundStyle(.tint)
      Spacer()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

#Preview {
  ContentView()
}
