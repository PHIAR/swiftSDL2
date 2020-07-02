// swift-tools-version:5.2

import PackageDescription

// MARK: - Platform configuration

let platforms: [SupportedPlatform] = [
   .iOS("13.2"),
   .macOS("10.15"),
   .tvOS("13.2"),
]

let package = Package(name: "swiftSDL2",
                      platforms: platforms,
                      products: [
                          .library(name: "swiftSDL2",
                                   targets: [
                                       "swiftSDL2",
                                   ]),
                      ],
                      dependencies: [
                      ],
                      targets: [
                          .systemLibrary(name: "CSDL2"),
                          .target(name: "swiftSDL2",
                                  dependencies: [
                                      "CSDL2",
                                  ]),
                          .testTarget(name: "swiftSDL2Tests",
                                      dependencies: [
                                          "swiftSDL2",
                                      ]),
                      ])
