//
//  LocationManager.swift
//  Tracify
//
//  Created by Jenna Lee on 2023-01-28.
//

import CoreLocation

// request the location from the user and update once
// ObservableObject - base class for objects that are observable by implementingINotifyPropertyChanged and INotifyProperty Changing interfaces. A starting point for all objects that need to support property change notifications
class LocationManager: NSObject, ObservableObject {
    
    // CLLocationManager object is the central place to manage the app's location behaviours
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        
        // gives the most accurate user location
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // request user location
        locationManager.requestWhenInUseAuthorization()
        
        // updates user location to be accessed
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !locations.isEmpty else {return}
        locationManager.stopUpdatingLocation()
        locationManager.stopUpdatingLocation()
    }
}
