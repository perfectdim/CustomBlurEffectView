# CustomBlurEffectView
Customizable blur effect view with blur radius, tint color and tint color alpha.

[![Version](https://img.shields.io/github/v/tag/perfectdim/CustomBlurEffectView)]()
[![Language](https://img.shields.io/badge/Swift-5-orange)](https://swift.org)
[![License](https://img.shields.io/github/license/perfectdim/CustomBlurEffectView)](https://github.com/perfectdim/CustomBlurEffectView/blob/master/LICENSE)

**CustomBlurEffectView** is a customizable blur effect view with blur radius, tint color and tint color alpha. This library uses the [UIVisualEffectView](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIVisualEffectView/) to generate the blur.

![Demo GIF](https://thumbs.gfycat.com/LimitedSorrowfulBellfrog-small.gif)

## Requirements

- iOS 9.0+
- Xcode 9.0+
- Swift 5

---

## Usage

Add an instance of CustomBlurEffectView to your view.

```swift
import CustomBlurEffectView

let customBlurEffectView = CustomBlurEffectView(
    radius: 20, // Set blur radius value. Defaults to `10` (CGFloat)
    color: .cyan, // Set tint color value. Defaults to `nil` (UIColor?)
    colorAlpha: 0.4 // Set tint color alpha value. Defaults to `0.8` (CGFloat)
)
customBlurEffectView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
addSubview(customBlurEffectView)
```

Either you can configure the view different way.
```swift
let customBlurEffectView = CustomBlurEffectView()
customBlurEffectView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
customBlurEffectView.blurRadius = 20
customBlurEffectView.colorTint = .cyan
customBlurEffectView.colorTintAlpha = 0.4
addSubview(customBlurEffectView)
```

CustomBlurEffectView is inherited from UIView, and  UIVisualEffectView is a subview of CustomBlurEffectView. To get UIVisualEffectView layer directly you can use `blurLayer` property:
```swift
let customBlurEffectView = CustomBlurEffectView()
let layer = customBlurEffectView.blurLayer
```

For more examples, take a look at the example project.

---

## Installation

### Swift Package Manager

In Xcode, select File ▸ Swift Packages ▸ Add Package Dependency…. Select target. Copy the following and paste into the combined search box:

```
https://github.com/perfectdim/CustomBlurEffectView.git
```

Click Next. Choose Package Options screen with Version selected under Rules and Up to next Major and 1.0.0 selected in dropdowns. Click Next. 

Xcode downloads the code from GitHub. Click Finish.

#### OR

In your Package.swift:

```swift
let package = Package(
  name: "Example",
  dependencies: [
    .package(url: "https://github.com/perfectdim/CustomBlurEffectView.git", from: "0.0.1")
  ],
  targets: [
    .target(name: "Example", dependencies: ["CustomBlurEffectView"])
  ]
)
```

Note that there’s now a Swift Package Dependencies section in the Project Navigator on the left and a Swift Packages tab in the Project settings.

### Manually

1. Download and drop `CustomBlurEffectView.swift`, `CustomBlurEffect.swift`, `UIVisualEffect+effectSettings.swift` in to your project.  
2. Done!

---

## Communication

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Disclaimer

CustomBlurEffectView utilizes a private UIKit API to do its magic. Use caution, submitting this code to the App Store adds the risk of being rejected!

## Credits

https://github.com/efremidze/VisualEffectView

## License

CustomBlurEffectView is available under the MIT license. See the LICENSE file for more info.
