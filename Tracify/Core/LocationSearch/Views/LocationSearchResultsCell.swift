//
//  LocationSearchResultsCell.swift
//  Tracify
//
//  Created by Stephen Lee on 2023-01-28.
//

import SwiftUI

struct LocationSearchResultsCell: View {
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .accentColor(.white)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Compass Card")
                    .font(.body)
                
                Text("999 Canada Pl, Vancouver, BC, V6C 3T4")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                
                Divider()
            }
            .padding(.leading, 8)
            .padding(.vertical, 8)
        }
        .padding(.leading)
    }
}

struct LocationSearchResultsCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchResultsCell()
    }
}
