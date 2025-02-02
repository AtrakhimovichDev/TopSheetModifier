// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TopSheetViewModifier",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "TopSheetViewModifier",
            targets: ["TopSheetViewModifier"]),
    ],
    targets: [
        .target(
            name: "TopSheetViewModifier",
            path: "Sources"),
    ]
)
