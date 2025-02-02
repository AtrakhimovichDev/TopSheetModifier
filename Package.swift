import PackageDescription

let package = Package(
    name: "TopSheetModifier",
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
            path: "Sources/TopSheetModifier")
    ]
)
