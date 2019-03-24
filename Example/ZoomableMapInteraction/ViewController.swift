//
//  ViewController.swift
//  ZoomableMapInteraction
//
//  Created by Sven Titgemeyer on 03/24/2019.
//  Copyright (c) 2019 Sven Titgemeyer. All rights reserved.
//

import UIKit
import MapKit
import ZoomableMapInteraction

class ViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.addInteraction(ZoomableMapInteraction())
    }
}

