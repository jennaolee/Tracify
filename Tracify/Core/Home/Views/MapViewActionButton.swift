//
//  MapViewActionButton.swift
//  Tracify
//
//  Created by Jenna Lee on 2023-01-28.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var showLocationSearchView: Bool
    var body: some View {
        Button {
            // when clicked, it will toggle between HomeView and SearchView
            withAnimation(.spring()) {
                showLocationSearchView.toggle()

            }
        } label: {
            Image(systemName: showLocationSearchView ? "arrow.left" : "line.3.horizontal")
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct MapViewActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewActionButton(showLocationSearchView: .constant(true))
    }
}
