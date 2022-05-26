//
//  AddNewTask.swift
//  TaskManager
//
//  Created by Тамерлан Ахмедов on 26.05.2022.
//

import SwiftUI

struct AddNewTask: View {
    @EnvironmentObject var taskModel: TaskViewModel
    @Environment(\.self) var env
    var body: some View {
        VStack(spacing: 12){
            Text("Edit Task")
                .font(.title3)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
                    Button {
                        env.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title3)
                            .foregroundColor(.black)
                    }

                }
            VStack(alignment: .leading, spacing: 12) {
                Text("Task Color")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                let colors: [String] =
                    ["Yellow", "Green", "Blue", "Purple", "Red", "Orange"]
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
    }
}

struct AddNewTask_Previews: PreviewProvider {
    static var previews: some View {
        AddNewTask()
            .environmentObject(TaskViewModel())
    }
}
