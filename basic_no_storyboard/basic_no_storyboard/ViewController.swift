//
//  ViewController.swift
//  basic_no_storyboard
//
//  Created by Candace Chiang on 11/3/18.
//  Copyright © 2018 Candace Chiang. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var mapView: MKMapView!
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = MKMapView()
        
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        mapView.frame = view.frame
        mapView.showsUserLocation = true
        
        view.addSubview(mapView)

        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0] as CLLocation
        
        manager.stopUpdatingLocation()
        
        let coordinate = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude,longitude: userLocation.coordinate.longitude)
        
        let latitude = 37.777569
        let longitude = -122.395214
        let point = CLLocationCoordinate2DMake(latitude, longitude)
        let annotation = MKPointAnnotation()
        annotation.coordinate = point
        mapView.addAnnotation(annotation)
        
        let distance = CLLocation(latitude: latitude, longitude: longitude).distance(from: CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude))
        let region = MKCoordinateRegionMakeWithDistance(coordinate, 2 * distance, 2 * distance)
        let adjust_region = mapView.regionThatFits(region)
        
        mapView.setRegion(adjust_region, animated: false)
    }

}



