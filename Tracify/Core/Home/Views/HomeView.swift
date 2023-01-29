//
//  HomeView.swift
//  Tracify
//
//  Created by Jenna Lee on 2023-01-28.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack(alignment: .top){
            MapViewRepresentable()
                .ignoresSafeArea()
            
            LocationSearchActivationView()
                .padding(.top, 72)
            
            MapViewActionButton()
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
