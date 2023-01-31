//
//  LocationSearchViewModel.swift
//  Tracify
//
//  Created by Jenna Lee on 2023-01-28.
//

import Foundation
import MapKit

// NSObject = the root class of most Objective-C hierarchies, subclass inherit a basic interface to the runtime system and the ability to behave as Objective-C objects
class LocationSearchViewModel: NSObject, ObservableObject {
    
    // MARK: - Properties
    // @Published allows us to create observable objects that automatically announce when changes occur
    // stores the most recently rececived seach completions
    // MKLocalSearchCompletion = a fully formed string that completes a partial string
    @Published var results = [MKLocalSearchCompletion]()
    
    // CLLocationCoordinate2D = the latitude and longitude of a location
    @Published var selectedLocationCoordinate: CLLocationCoordinate2D?
    
    // MKLocalSearchCompleter - retrieve auto-complete suggestions for map-based search controls
    // input the user's query into the search completer which delivers possible string completions
    private let searchCompleter = MKLocalSearchCompleter()
    
    // retreive the string from the "Where to?" textfield
    var queryFragment: String = "" {
        didSet {
            searchCompleter.queryFragment = queryFragment
            print("DEBUG: Query fragment is \(searchCompleter.queryFragment)")
        }
    }
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
        
    }
    
    // MARK: - Helpers
    func selectLocation(_ localSearch: MKLocalSearchCompletion) {
        locationSearch(forLocalSearchCompletion: localSearch) { response, error in
            
            if let error = error {
                print("DEBUG: Location search failed with error \(error.localizedDescription)")
                return
            }
            
            // retrieve the first of the mapItems to get the coordinates
            guard let item = response?.mapItems.first else { return }
            let coordinate = item.placemark.coordinate
            self.selectedLocationCoordinate = coordinate
            
            print("DEBUG: Location Coordinates \(coordinate)")
        }
        
    }
    
    // searches for the location
    // @escaping = the closure will outlive or leave the scope passed to it
    // MKLocalSearch.CompletionHandler = completion handler block for a search operation
    func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion,
                        completion: @escaping MKLocalSearch.CompletionHandler) {
        // configure search request
        let searchRequest = MKLocalSearch.Request()
        // string containing the search term
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)

        // search is executed
        let search = MKLocalSearch(request: searchRequest)
        search.start(completionHandler: completion)
    }
}

// MARK: -MKLocalSearchCompleterDelegate

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    
    // update the results from the searchCompleter
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
    
    
    
}
