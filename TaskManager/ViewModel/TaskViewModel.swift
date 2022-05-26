//
//  TaskViewModel.swift
//  TaskManager
//
//  Created by Тамерлан Ахмедов on 26.05.2022.
//

import SwiftUI
import CoreData

class TaskViewModel: ObservableObject {
    @Published var currentTab: String = "Today"
    @Published var openEditTask: Bool = false
    @Published var taskTitle: String = ""
    @Published var taskColor: String = "Yellow"
    @Published var taskDeadline: Date = Date()
    @Published var taskType: String = "Basic"

    func addTask(context: NSManagedObjectContext) -> Bool {
        let task  = Task (context: context)
        task.title = taskTitle
        task.color = taskColor
        task.deadline = taskDeadline
        task.type = taskType
        
        if let _ = try? context.save() {
            return true
        }
        return false 
    }
}
