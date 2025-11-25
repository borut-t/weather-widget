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
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.0.0")
  ],
  targets: [
    .target(
      name: "WeatherCore",
      dependencies: [
        .product(name: "Dependencies", package: "swift-dependencies")
      ],
      path: "Sources"
    )
  ]
)
