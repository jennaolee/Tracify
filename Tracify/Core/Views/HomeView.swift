//
//  HomeView.swift
//  Tracify
//
//  Created by Jenna Lee on 2023-01-28.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        MapViewRepresentable()
            .ignoresSafeArea()

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
