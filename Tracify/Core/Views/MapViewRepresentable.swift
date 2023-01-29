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
    
    // make & configure the view to be represented in the app
    func makeUIView(context: Context) -> some UIView {
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    // updates the view when user makes changes
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension MapViewRepresentable {
    class MapCoordinator: NSObject, MKMapViewDelegate {
        let parent: MapViewRepresentable
        
        init(parent:MapViewRepresentable) {
            self.parent = parent
            super.init()
        }
    }
}
