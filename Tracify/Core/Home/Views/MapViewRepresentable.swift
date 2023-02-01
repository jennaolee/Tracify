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
    
    // MKMapView = the embedded map (Apple Maps)
    let mapView = MKMapView()
    let locationManager = LocationManager()
    @Binding var mapState: MapViewState
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
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
        print("DEBUG:  Map state is \(mapState)")
        
        switch mapState {
        case .noInput:
            // clears the map
            context.coordinator.clearMapViewAndRecenterOnUserLocation()
            break
        case .searchingForLocation:
            break
            
        case .locationSelected:
            if let coordinate = locationViewModel.selectedLocationCoordinate {
                print("DEBUG: Selected location in map view is \(coordinate)")
                context.coordinator.addAndSelectAnnotation(withCoordinate: coordinate)
                context.coordinator.configurePolyline(withDestinationCoordinate: coordinate)
            }
            break
        }
        
        
        
//        if mapState == .noInput {
//            context.coordinator.clearMapViewAnfRecenterOnUserLocation()
//        }
        
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension MapViewRepresentable {
    
    // use MapCoordinator to alter the MapView
    class MapCoordinator: NSObject, MKMapViewDelegate {
        
        // MARK: - Properties
        
        // used to communicate between MapCoordinator and MapViewRepresentable class
        let parent: MapViewRepresentable
        var userLocationCoordinate: CLLocationCoordinate2D?
        // to be updated the same as the userLocation coordinate
        var currentRegion: MKCoordinateRegion?
        
        // MARK: - Lifecycle
        init(parent:MapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        
        // MARK: - MKMapViewDelegate
        
        // handles location updates
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            self.userLocationCoordinate = userLocation.coordinate
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
            
            // everytime the user updates their location, the currentRegion will update as well
            self.currentRegion = region
            
            // sets the region based on the user's location on mapView
            parent.mapView.setRegion(region, animated:true)
        }
        
        // adds a polyline with thw following customizations
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let polyline = MKPolylineRenderer(overlay: overlay)
            polyline.strokeColor = .systemBlue
            polyline.lineWidth = 6
            return polyline
        }
        
        // MARK: - Helpers
        func addAndSelectAnnotation(withCoordinate coordinate: CLLocationCoordinate2D) {
            // only one marker on the map at a time
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            
            let anno = MKPointAnnotation()
            anno.coordinate = coordinate
            parent.mapView.addAnnotation(anno)
            
            // animated marker
            parent.mapView.selectAnnotation(anno, animated: true)
            
            // fit map to include both markers
            parent.mapView.showAnnotations(parent.mapView.annotations, animated:true)
            
        }
        
        // configures the polyline of the given destination route
        func configurePolyline(withDestinationCoordinate coordinate: CLLocationCoordinate2D) {
            guard let userLocationCoordinate = self.userLocationCoordinate else { return }
            getDesitnationRoute(from: userLocationCoordinate, to: coordinate) { route in
                self.parent.mapView.addOverlay(route.polyline)
                
            }
            
        }
        
        // get the destination route to be turned into a polyline
        func getDesitnationRoute(from userLocation: CLLocationCoordinate2D,
                                 to destinationCoordinate: CLLocationCoordinate2D,
                                 completion: @escaping(MKRoute) -> Void) {
            let userPlacemark = MKPlacemark(coordinate: userLocation)
            let destPlacemark = MKPlacemark(coordinate: destinationCoordinate)
            let request = MKDirections.Request()
            
            // configure the request with data
            request.source = MKMapItem(placemark: userPlacemark)
            request.destination = MKMapItem(placemark: MKPlacemark(placemark: destPlacemark))
            
            // directions request is an API - Apple executes the search to generate the direction
            let directions = MKDirections(request: request)
            directions.calculate { response, error in
                if let error = error {
                    print("DEBUG: Failed to get directions with error \(error.localizedDescription)")
                    return
                }
                
                // get the first route (usually the fastest)
                guard let route = response?.routes.first else { return }
                completion(route)
            }
        }
        
        // clear the mapView & re-center
        func clearMapViewAndRecenterOnUserLocation() {
            // remove all overlays & annotations, re-center the map
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            parent.mapView.removeOverlays(parent.mapView.overlays)
            
            if let currentRegion = currentRegion {
                parent.mapView.setRegion(currentRegion, animated: true)
            }
        }
    }
}
