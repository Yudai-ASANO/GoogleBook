// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GoogleBookAppFeature",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "TopFeature",
            targets: ["TopFeature"]),
    ],
    dependencies: [
        .package(path: "../GoogleBookCore")
    ],
    targets: [
        .target(
            name: "TopFeature",
            dependencies: [.product(name: "APIClient", package: "GoogleBookCore")]
        )
    ]
)
