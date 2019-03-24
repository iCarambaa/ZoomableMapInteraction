# ZoomableMapInteraction

[![Version](https://img.shields.io/cocoapods/v/ZoomableMapInteraction.svg?style=flat)](https://cocoapods.org/pods/ZoomableMapInteraction)
[![License](https://img.shields.io/cocoapods/l/ZoomableMapInteraction.svg?style=flat)](https://cocoapods.org/pods/ZoomableMapInteraction)
[![Platform](https://img.shields.io/cocoapods/p/ZoomableMapInteraction.svg?style=flat)](https://cocoapods.org/pods/ZoomableMapInteraction)

ZoomableMapInteraction is a `UIInteraction` which can be used to add the tap-and-pan zooming behavior seen in Apple Maps to any `MKMapView`.

To add the interaction to a `mapView` you write:

```swift
mapView.addInteraction(ZoomableMapInteraction())
```

You can check the example project which includes only a plain `MKMapView` with the interaction added. Open the example project using
```bash
pod try ZoomableMapInteraction
```

## Requirements

Because this project implements a `UIInteraction` it requires iOS 11. It depends only on UIKit and MapKit.

## Installation

There's only one file, `ZoomableMapInteraction.swift`, which you can either add to your project directly or you can use cocoapods. 

To use cocoapods:

```ruby
pod 'ZoomableMapInteraction'
```

## Author

Sven Titgemeyer, s.titgemeyer@titgemeyer-it.de

## License

ZoomableMapInteraction is available under the MIT license. See the LICENSE file for more info.
