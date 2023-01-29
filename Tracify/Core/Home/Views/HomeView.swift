//
//  HomeView.swift
//  Tracify
//
//  Created by Jenna Lee on 2023-01-28.
//

import SwiftUI

struct HomeView: View {
    @State private var showLocationSearchView = false
    
    var body: some View {
        ZStack(alignment: .top){
            MapViewRepresentable()
                .ignoresSafeArea()
            
            if showLocationSearchView {
                LocationSearchView(showLocationSearchView: $showLocationSearchView)
            } else {
                LocationSearchActivationView()
                    .padding(.top, 72)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            showLocationSearchView.toggle()
                            // when clicked, it will toggle between HomeView and SearchView
                        }
                    }
            }
            
            // when showLocationSearchView changes in the MapViewActionButton class it will also change here b/c those properties are bound together
            MapViewActionButton(showLocationSearchView: $showLocationSearchView)
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
