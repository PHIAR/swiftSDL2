// swift-tools-version:5.2

import PackageDescription

let package = Package(name: "swiftSDL2",
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
