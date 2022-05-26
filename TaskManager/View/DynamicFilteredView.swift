//
//  DynamicFilteredView.swift
//  TaskManager
//
//  Created by Тамерлан Ахмедов on 26.05.2022.
//

import SwiftUI
import CoreData

struct DynamicFilteredView<Content: View,T>: View where T: NSManagedObject {
    @FetchRequest var request: FetchedResults<T>
    let content: (T) -> Content
    
    init(currentTab: String, @ViewBuilder content: @escaping (T) -> Content) {
        let calendar = Calendar.current
        var predicate: NSPredicate!
        
        if currentTab == "Today"{
            let today = calendar.startOfDay(for: Date())
            let tommorow = calendar.date(byAdding: .day, value: 1, to : today)!
            let filterKey = "taskDate"
            predicate = NSPredicate(format: "\(filterKey) >= %@ AND \(filterKey) <%@ AND isCompleted == %I", argumentArray: [today, tommorow, 0])
        } else if currentTab == "Upcoming" {
            let today = calendar.startOfDay(for: calendar.date(byAdding: .day, value: 1, to : Date())!)
            let tommorow = Date.distantFuture
            let filterKey = "taskDate"
            predicate = NSPredicate(format: "\(filterKey) >= %@ AND \(filterKey) <%@ AND isCompleted == %I", argumentArray: [today, tommorow, 0])
        } else if currentTab == "Failed" {
            let today = calendar.startOfDay(for: Date())
            let past = Date.distantPast
            let filterKey = "taskDate"
            predicate = NSPredicate(format: "\(filterKey) >= %@ AND \(filterKey) <%@ AND isCompleted == %I", argumentArray: [past, today, 0])
        } else {
             
        }
        
        _request = FetchRequest(entity: T.entity(), sortDescriptors: [.init(keyPath: \Task.taskDate, ascending: false)], predicate: predicate)
        self.content = content
        
        
    }
    
    var body: some View {
        Group {
            if request.isEmpty {
                Text("No tasks found!")
                    .font(.system(size: 16))
                    .fontWeight(.light)
                    .offset(y: 100)
            } else {
                ForEach(request, id: \.objectID) { object in
                    self.content(object)
                }
            }
        }
    }
}

