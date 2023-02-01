//
//  MapViewActionButton.swift
//  Tracify
//
//  Created by Jenna Lee on 2023-01-28.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var mapState: MapViewState
    var body: some View {
        Button {
            // when clicked, it will toggle between HomeView and SearchView
            withAnimation(.spring()) {
                // update the mapState accordingly when button is clicked
                actionForState(mapState)

            }
        } label: {
            // generate the
            Image(systemName: imageNameForState(mapState))
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // check the state and perform the correct action
    func actionForState(_ state: MapViewState) {
        switch state {
        case .noInput:
            print("DEBIG: No Input")
            
        case .searchingForLocation:
            // return back to empty map if button is clicked
            mapState = .noInput
            
        case .locationSelected:
            print("DEBUG: Clear map view")
            mapState = .noInput
        }
    }
    
    // adjust the image based on the mapState
    func imageNameForState(_ state: MapViewState) -> String {
        switch state {
        // on the empty map, button is the hamburger menu
        case .noInput:
            return "line.3.horizontal"
        // in any other state, the button is a back arrow
        case .searchingForLocation, .locationSelected:
            return "arrow.left"
        }
        
    }
}

struct MapViewActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewActionButton(mapState: .constant(.noInput))
    }
}
