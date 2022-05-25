//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by Тамерлан Ахмедов on 25.05.2022.
//

import SwiftUI

@main
struct TaskManagerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
