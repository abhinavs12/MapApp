//
//  ViewController.swift
//  MapApp
//
//  Created by Mansi Gupta on 2018-04-16.
//  Copyright © 2018 Mansi Gupta. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    let defaultLatitude = 43.6532
    var delta = 10.0
    let defaultLongitude = -79.3832
    let mapLocation = CLLocationCoordinate2DMake(43.6532, -79.3832)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loc = CLLocationCoordinate2DMake(defaultLatitude, defaultLongitude)
        let span = MKCoordinateSpanMake(delta, delta)
        let reg = MKCoordinateRegionMake(loc, span)
        self.map.region = reg
        
        let ann = MKPointAnnotation()
        ann.coordinate = self.mapLocation
        ann.title = "Toronto"
        ann.subtitle = "Awesome Place"
        
        self.map.addAnnotation(ann)
        
    }

}

