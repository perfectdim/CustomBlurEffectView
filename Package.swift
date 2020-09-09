// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "CustomBlurEffectView",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "CustomBlurEffectView",
            targets: ["CustomBlurEffectView"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CustomBlurEffectView",
            dependencies: []),
    ]
)
