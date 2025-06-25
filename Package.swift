// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "WireGuard-iOS",
    platforms: [
        .iOS(.v14),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "WireGuardKit",
            targets: ["WireGuardKit"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "wg-go",
            path: "./Libs/wg-go.xcframework"
        ),
        .target(
          name: "WireGuardKitC",
          dependencies: ["wg-go"],
          publicHeadersPath: "include",
          cSettings: [
                 .headerSearchPath("include")
          ],
          linkerSettings: [
                 .unsafeFlags(["-w"])
             ]
        ),
        .target(
            name: "WireGuardKit",
            dependencies: [
                "WireGuardKitC"
            ]
        )
    ]
)
