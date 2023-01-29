//
//  TracifyApp.swift
//  Tracify
//
//  Created by Jenna Lee on 2023-01-28.
//

import SwiftUI

@main
struct TracifyApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
