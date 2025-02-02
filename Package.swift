// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TopSheetViewModifier", // Замените на название вашего фреймворка
    platforms: [
        .iOS(.v16)      // Минимальная версия iOS
    ],
    products: [
        .library(
            name: "TopSheetViewModifier", // Замените на название вашего фреймворка
            targets: ["TopSheetViewModifier"]), // Замените на название вашего фреймворка
    ],
    targets: [
        .target(
            name: "TopSheetViewModifier", // Замените на название вашего фреймворка
            path: "TopSheetViewModifier"),   // Путь к папке с исходными файлами
    ]
)
