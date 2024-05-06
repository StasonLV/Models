// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Models",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v16),
        .tvOS(.v12),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "Models",
            targets: ["Models"]),
    ],
    
    targets: [
        .target(
            name: "Models",
            path: "Sources"),
        .testTarget(
            name: "ModelsTests",
            dependencies: ["Models"]),
    ]
)
