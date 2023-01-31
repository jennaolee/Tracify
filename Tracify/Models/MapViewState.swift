//
//  MapViewState.swift
//  Tracify
//
//  Created by Jenna Lee on 2023-01-29.
//

import Foundation

// handles the different states the user could be in
enum MapViewState {
    // user has not entered any input - empty map
    case noInput
    
    // user is searching for location - dynamic search menu
    case searchingForLocation
    
    // user has selected a location - route is generated and displayed
    case locationSelected
}
