// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HoaUIKit",
    platforms: [.iOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "HoaUIKit",
            targets: ["HoaUIKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "HoaUIKit",
            dependencies: [
                "SnapKit"
            ],
            resources: [
                .process("Sources/Assets/assets.xcassets"),
            ]
        ),
        .testTarget(
            name: "HoaUIKitTests",
            dependencies: ["HoaUIKit"]),
    ]
)
