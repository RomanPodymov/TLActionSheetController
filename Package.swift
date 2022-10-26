// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
	name: "TLActionSheetController",
	platforms: [
		.iOS(.v11)
	],
	products: [
		.library(
			name: "TLActionSheetController",
			targets: ["TLActionSheetController"])
	],
	targets: [
		.target(
			name: "TLActionSheetController",
			dependencies: [],
			path: "TLActionSheetController"
		)
	]
)
