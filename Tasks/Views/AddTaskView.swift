//
//  AddTaskView.swift
//  Tasks
//
//  Created by Brad Meyn on 15/5/2023.
//

import SwiftUI

struct AddTaskView: View {
    @State private var textFieldSummary: String = ""
    @State private var textFieldDetail: String = ""
    
    @Environment(\.managedObjectContext) private var managedObjectContext
    let taskController: TaskController

    init(taskController: TaskController) {
        self.taskController = taskController
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Summary")
                    .padding(5)
                    .fontWeight(.bold)
                
                TextField("Task Summary", text: $textFieldSummary)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Detail")
                    .padding(5)
                    .fontWeight(.bold)
                
                TextEditor(text: $textFieldDetail)
                    .frame(height: 200)
                    .padding(5)
                    .border(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                
                Button(action: {
                    taskController.addTask(summary: textFieldSummary, detail: textFieldDetail)
                }) {
                    Label("Add Task", systemImage: "plus")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Add a Task")
    }
}
