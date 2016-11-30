import PackageDescription

let package = Package(
 name: "Test",
 dependencies: [
   .Package(url: "../../SwiftPMCaseBug", majorVersion: 1, minor: 0),
 ]
)
