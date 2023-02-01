//
//  MusicInfoView.swift
//  Tracify
//
//  Created by Stephen Lee on 2023-02-01.
//

import SwiftUI

struct MusicInfoView: View {
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
            
            // submission info view
            
            
            Text("SONG")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(Color(.gray))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Text("We Are The Champions")
                .font(.subheadline)
                .fontWeight(.bold)
            
            Text("Queen")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            
            Image("Jazz")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .background(Color(.white))
            
            
            Divider()
                .padding(.vertical, 8)
            
            // song selection
            Text("TIME")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(Color(.gray))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 12) {
                
                Text("8:00 PM")
                    .font(.subheadline)
                    .fontWeight(.bold)
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
            
            
            
            
            // location
            Text("LOCATION")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(Color(.gray))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 12) {
                VStack(alignment: .leading) {
                    Text("English Bay")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    
                    Text("Vancouver, BC")
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
            
            

            

            // save button
            
        }
        .background(.white)
    }
}

struct MusicInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MusicInfoView()
    }
}
