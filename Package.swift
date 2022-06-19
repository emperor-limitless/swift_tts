// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

var libname = "tts"
#if os(Windows)
libname = "tts.dll"
#endif
let package = Package(
    name: "tts",
    products: [
        .library(
            name: "swift_tts",
            type: .dynamic,
            targets: ["tts"]),
    ],
    dependencies: [
    ],
    targets: [
        .systemLibrary (
            name: "Ctts"),
        .target(
            name: "tts",
            dependencies: ["Ctts"], linkerSettings: [.linkedLibrary(libname)]),
    ]
)
