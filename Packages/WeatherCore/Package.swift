// swift-tools-version: 5.10
import PackageDescription

let package = Package(
  name: "WeatherCore",
  platforms: [
    .iOS(.v17),
    .macOS(.v14)
  ],
  products: [
    .library(name: "WeatherCore", targets: ["WeatherCore"])
  ],
  targets: [
    .target(
      name: "WeatherCore",
      dependencies: [],
      path: "Sources"
    )
  ]
)
