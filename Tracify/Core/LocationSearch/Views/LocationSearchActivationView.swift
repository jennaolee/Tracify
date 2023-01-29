//
//  LocationSearchActivationView.swift
//  Tracify
//
//  Created by Stephen Lee on 2023-01-28.
//

import SwiftUI

struct LocationSearchActivationView: View {
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.black)
                .frame(width: 8, height: 8)
                .padding(.horizontal)
                
            Text("Search Item")
                .foregroundColor(Color(.darkGray))
            
            Spacer()
                
        }
        .frame(width:UIScreen.main.bounds.width - 64, height: 50)
        .background(
            Rectangle()
            .fill(Color.white)
            .shadow(color: .black, radius: 6)
        )
    }
}

struct LocationSearchActivationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchActivationView()
    }
}
