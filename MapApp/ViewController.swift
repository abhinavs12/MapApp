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
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var longitude: UITextField!
    
    @IBOutlet weak var magnitude: UITextField!
    let defaultLatitude = 43.6532
    var delta = 10.0
    let defaultLongitude = -79.3832
    var mapLocation = CLLocationCoordinate2DMake(43.6532, -79.3832)
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
    @IBAction func searchLocation(_ sender: UIButton) {
        
        var longDouble = Double(longitude.text!)
        var latDouble = Double(latitude.text!)
        var mag = Double(magnitude.text!)
        
        //var mapLoc = CLLocationCoordinate2DMake(latDouble!, longDouble!)
        self.mapLocation = CLLocationCoordinate2DMake(latDouble!, longDouble!)
        
        let loc = CLLocationCoordinate2DMake(latDouble!, longDouble!)
        let span = MKCoordinateSpanMake(mag!, mag!)
        let reg = MKCoordinateRegionMake(loc, span)
        self.map.region = reg
        
        let ann = MKPointAnnotation()
        ann.coordinate = self.mapLocation
        ann.title = "Your Place"
        ann.subtitle = "Awesome Place"
        
        self.map.addAnnotation(ann)
    }
    
    @IBAction func seeInMapApp(_ sender: UIButton) {
        
        let placemark = MKPlacemark(coordinate: self.mapLocation, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Awesome Place"
        
        //opens our location in map app
        mapItem.openInMaps(launchOptions: [
            
            MKLaunchOptionsMapTypeKey: MKMapType.standard.rawValue,
            MKLaunchOptionsMapCenterKey: self.map.region.center,
            MKLaunchOptionsMapSpanKey: self.map.region.span
            
            
            
            ])
        
    }
}

