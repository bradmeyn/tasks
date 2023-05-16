import SwiftUI

@main
struct TasksApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            let managedObjectContext = persistenceController.container.viewContext
            let taskController = TaskController(context: managedObjectContext)
         
            NavigationView {
                ListView(taskController: taskController)
                    .environment(\.managedObjectContext, managedObjectContext)
            }
        }
    }
}


