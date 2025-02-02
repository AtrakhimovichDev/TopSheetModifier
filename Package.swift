// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TopSheetViewModifier",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "TopSheetModifier",
            targets: ["TopSheetModifier"]),
    ],
    targets: [
        .target(
            name: "TopSheetModifier",
            path: "Sources"),
    ]
)
