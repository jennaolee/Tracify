//
//  MapViewRepresentable.swift
//  Tracify
//
//  Created by Jenna Lee on 2023-01-28.
//

import SwiftUI
import MapKit

// adds more capability to the SwiftUI Map Component capability
struct MapViewRepresentable: UIViewRepresentable {
    
    // the UI Kit Map View Component
    let mapView = MKMapView()
    let locationManager = LocationManager()
    
    // makes the map view that is displayable, sets location and zooms in on location
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    // updates the view when user makes changes
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    //
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension MapViewRepresentable {
    
    // use MapCoordinator to alter the MapView
    class MapCoordinator: NSObject, MKMapViewDelegate {
        
        // used to communicate between MapCoordinator and MapViewRepresentable class
        let parent: MapViewRepresentable
        
        init(parent:MapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        
        // handles location updates
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
            
            // sets the region based on the user's location on mapView
            parent.mapView.setRegion(region, animated:true)
        }
    }
}
