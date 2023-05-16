import SwiftUI

struct ListView: View {
    @ObservedObject private var taskController: TaskController
    
    init(taskController: TaskController) {
        self.taskController = taskController
    }
    
    var body: some View {
        Group {
            if taskController.tasks.isEmpty {
                Text("No tasks").fontWeight(.heavy)
                    .navigationBarTitle("Tasks")
                    .navigationBarItems(
                        leading: EditButton(),
                        trailing: NavigationLink("Add", destination: AddTaskView(taskController: taskController))
                    )
            } else {
                List {
                    ForEach(taskController.tasks) { task in
                        TaskRowView(task: task)
                    }
                }
                .navigationBarTitle("Tasks")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: NavigationLink("Add", destination: AddTaskView(taskController: taskController))
                )
            }
        }
    }
}



