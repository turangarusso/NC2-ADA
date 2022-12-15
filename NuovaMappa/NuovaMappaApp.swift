//
//  NuovaMappaApp.swift
//  NuovaMappa
//
//  Created by giovanni russo on 06/12/22.
//

import SwiftUI

@main
struct NuovaMappaApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
