//
//  ZoomableMapInteraction.swift
//  ZoomableMapInteraction
//
//  Created by Sven Titgemeyer on 23.03.19.
//  Copyright © 2019 Sven Titgemeyer. All rights reserved.
//

import UIKit
import MapKit
import os

/// An interaction that adds the capability to zoom a map with one hand.
///
/// The same behavior is implemented in Apple Maps and Google Maps. A user
/// can single-handedly zoom by tapping and panning the map.
public class ZoomableMapInteraction: NSObject, UIInteraction {
    static private let logSystem = OSLog(subsystem: "com.titgemeyer.ZoomableMapInteraction", category: "ZoomableMapInteraction")

    /// Implements the actual behavior.
    ///
    /// By using a separate class we can simply discard the controller
    /// and create a new one when being added to a new view.
    private var controller: MapZoomController?
    
    // MARK: - UIInteraction
    public var view: UIView?
    public func willMove(to view: UIView?) {}
    public func didMove(to view: UIView?) {
        if let view = view {
            // Create a MapZoomController for the new view.
            precondition(view is MKMapView, "ZoomableMapInteraction can only be added to MKMapViews")
            self.controller = MapZoomController(map: view as! MKMapView)
        } else {
            controller = nil
        }
    }
    
    private class MapZoomController: NSObject, UIGestureRecognizerDelegate {
        private weak var map: MKMapView?
        private var longPressGesture: UILongPressGestureRecognizer!
        
        init(map: MKMapView) {
            self.map = map
            super.init()
            self.longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGestureDidChange(gesture:)))
            longPressGesture.allowableMovement = CGFloat.greatestFiniteMagnitude
            longPressGesture.numberOfTapsRequired = 1
            longPressGesture.minimumPressDuration = 0
            map.addGestureRecognizer(longPressGesture)
            longPressGesture.delegate = self
        }
        
        // MARK: - Gesture Recognizer
        
        private var lastPosition: CGFloat = 0
        @objc private func longPressGestureDidChange(gesture: UILongPressGestureRecognizer) {
            guard let map = map else { return }
            switch (gesture.state) {
            case .began:
                if #available(iOS 12.0, *) {
                    os_log(.info, log: ZoomableMapInteraction.logSystem, "Will zoom map using ZoomableMapInteraction")
                }
                lastPosition = gesture.location(in: map).y
            case .changed:
                // Calculate a change of camera altitude based on current altitude and
                // translation in the view.
                //
                // Changes should be faster in higher altitude than close to the ground.
                // The behavior here isn't exactly the same as in Apple Maps,
                // feel free to improve :).
                let newPosition = gesture.location(in: map).y
                let translationY = lastPosition - newPosition
                let oldAltitude = map.camera.altitude
                let scaleFactor = CLLocationDistance(translationY)
                let newAltitude = oldAltitude - oldAltitude/200 * scaleFactor
                map.camera.altitude = newAltitude
                lastPosition = newPosition
            case .ended:
                if #available(iOS 12.0, *) {
                    os_log(.info, log: ZoomableMapInteraction.logSystem, "Did zoom map using ZoomableMapInteraction")
                }
            default:
                break
            }
        }
        
        func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            // Require any double tap gesture which is on the same view to fail before starting our interaction.
            // This includes the standard double tap to zoom gesture and custom gestures which might exist.
            if let other = otherGestureRecognizer as? UITapGestureRecognizer, other.numberOfTapsRequired == 2 {
                return true
            } else {
                return false
            }
        }
        
        deinit {
            self.map?.removeGestureRecognizer(longPressGesture)
        }
    }
}
