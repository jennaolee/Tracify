//
//  MusicSubmissionView.swift
//  Tracify
//
//  Created by Stephen Lee on 2023-01-31.
//

import SwiftUI

struct MusicSubmissionView: View {
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
            
            // submission info view
            HStack {
                
                // sidebar/ indicator view
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 8, height: 8)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 32)
                    
                    Rectangle()
                        .fill(Color(.black))
                        .frame(width: 8, height: 8)
                    
                }
                
                VStack(alignment: .leading, spacing: 24) {
                    HStack {
                        Text("Current Location")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text("7:00 PM")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom, 10)
                    
                    HStack {
                        Text("English Bay")
                            .font(.system(size: 16, weight: .semibold))
                        
                        Spacer()
                        
                        Text("8:00 PM")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.leading, 8)
            }
            .padding()
            
            Divider()
            
            Text("SUGGESTED GENRES")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(Color(.gray))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(0 ..< 3, id: \.self) { _ in
                        VStack(alignment: .leading) {
                            Image("Jazz")
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: 150, height: 150)
                        .background(Color(.white))
                    }
                }
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.vertical, 8)
            
            // song selection
            Text("SELECT SONG")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(Color(.gray))
                .frame(maxWidth: .infinity, alignment: .leading)
            
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

            // save button
            Button {
                
            } label: {
                Text("SAVE")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .background(.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }
        .background(.white)
    }
}

struct MusicSubmissionView_Previews: PreviewProvider {
    static var previews: some View {
        MusicSubmissionView()
    }
}
