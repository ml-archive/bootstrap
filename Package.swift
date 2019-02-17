// swift-tools-version:4.1
import PackageDescription

let package = Package(
    name: "Bootstrap",
    products: [
        .library(name: "Bootstrap", targets: ["Bootstrap"])
    ],
    dependencies: [
        .package(url: "https://github.com/nodes-vapor/sugar.git", from: "4.0.0-beta.2"),
        .package(url: "https://github.com/vapor/leaf.git", from: "3.0.0-rc"),
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
    ],
    targets: [
        .target(name: "Bootstrap", dependencies: ["Leaf", "Vapor", "Sugar"]),
        .testTarget(name: "BootstrapTests", dependencies: ["Bootstrap"])
    ]
)
