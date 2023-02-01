//
//  HomeView.swift
//  Tracify
//
//  Created by Jenna Lee on 2023-01-28.
//

import SwiftUI

struct HomeView: View {
    @State private var mapState = MapViewState.noInput
    
    var body: some View {
        ZStack(alignment: .top){
            // fit to screen
            MapViewRepresentable(mapState: $mapState)
                .ignoresSafeArea()
            
            if mapState == .searchingForLocation {
                // show the locationSearchView
                LocationSearchView(mapState: $mapState)
                
            } else if mapState == .noInput {
                // show searchActivationView
                LocationSearchActivationView()
                    .padding(.top, 72)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            mapState = .searchingForLocation
                            // when SearchActivation is clicked, it will set the view to searchingForLocation
                        }
                    }
            }
            
            // when mapState changes in the MapViewActionButton class it will also change here b/c those properties are bound together
            MapViewActionButton(mapState: $mapState)
                .padding(.leading)
                .padding(.top, 4)
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
