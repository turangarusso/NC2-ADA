//
//  StaticVar_NC2App.swift
//  StaticVar-NC2
//
//  Created by Sofia Esposito on 06/12/22.
//

import SwiftUI

@main
struct StaticVar_NC2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
