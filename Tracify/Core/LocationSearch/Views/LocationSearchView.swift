//
//  LocationSearchView.swift
//  Tracify
//
//  Created by Jenna Lee on 2023-01-28.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @State var viewModel = LocationSearchViewModel()
    @Binding var showLocationSearchView: Bool
    

    var body: some View {
        
        VStack {
            // header view
            HStack {
                
                // images
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    
                    Rectangle()
                        .fill(Color(.black))
                        .frame(width: 6, height: 6)
                    
                }
                
                // textfields
                VStack {
                    TextField("Current location", text: $startLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    
                    TextField("Where to?", text: $viewModel.queryFragment)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                }

                
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
            // list view
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.results, id: \.self) {
                        result in
                        LocationSearchResultsCell(title: result.title, subtitle: result.subtitle)
                            .onTapGesture {
                                showLocationSearchView.toggle()
                            }
                    }
                }
            }
        }
        .background(.white)
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView(showLocationSearchView: .constant(false))
    }
}
