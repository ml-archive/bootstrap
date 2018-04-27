// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Bootstrap",
    products: [
        .library(name: "Bootstrap", targets: ["Bootstrap"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0-rc"),
    ],
    targets: [
        .target(name: "Bootstrap", dependencies: ["Vapor"]),
        .testTarget(name: "BootstrapTests", dependencies: ["Bootstrap", "Vapor"])
    ]
)
