// swift-tools-version:4.0

import PackageDescription

let package = Package(
  name: "game-service-api",
  products: [
    .library(
      name: "game-service-api",
      targets: ["game-service-api"]),
    ],
  dependencies: [
    .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "2.4.0")),
    .package(url: "https://github.com/goRestart/core-service.git", .branch("develop")),
  ],
  targets: [
    .target(
      name: "game-service-api",
      dependencies: ["Vapor", "CoreService"]),
    .testTarget(
      name: "game-service-apiTests",
      dependencies: ["game-service-api"]
    )]
)
