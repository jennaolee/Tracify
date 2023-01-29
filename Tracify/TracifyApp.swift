//
//  TracifyApp.swift
//  Tracify
//
//  Created by Stephen Lee on 2023-01-28.
//

import SwiftUI

@main
struct TracifyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
