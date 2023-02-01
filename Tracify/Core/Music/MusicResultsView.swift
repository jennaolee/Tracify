//
//  MusicSubmissionView.swift
//  Tracify
//
//  Created by Stephen Lee on 2023-01-31.
//

import SwiftUI

struct MusicResultsView: View {
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
            
                     
            Text("SAVED SONGS")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(Color(.gray))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ForEach(0 ..< 10, id: \.self) { _ in
                HStack(spacing: 12) {
                    VStack(alignment: .leading) {
                        Text("We Are The Champions")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        Text("Queen")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                    }
                    .padding(.horizontal)
                   
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .imageScale(.medium)
                        .padding()
                    
                }
                .frame(height: 50)
                .background(Color(.systemGroupedBackground))
                .cornerRadius(10)
                .padding(.horizontal)
            }
        }
            
    }
}

struct MusicResultsView_Previews: PreviewProvider {
    static var previews: some View {
        MusicResultsView()
    }
}
