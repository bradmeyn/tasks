import CoreData

class TaskController: ObservableObject {
    @Published var tasks: [Task] = []
    
    private let managedObjectContext: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.managedObjectContext = context
        fetchTasks()
    }
    
    // Fetches tasks from Core Data and updates the tasks array
    func fetchTasks() {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            tasks = try managedObjectContext.fetch(fetchRequest)
        } catch {
            print("Error fetching tasks: \(error)")
        }
    }
    
    // Adds a new task to Core Data
    func addTask(summary: String, detail: String) {
        let newTask = Task(context: managedObjectContext)
        newTask.summary = summary
        newTask.detail = detail
        newTask.id = UUID()
        newTask.completed = false
        newTask.completedDate = nil
        
        do {
            try managedObjectContext.save()
            fetchTasks() // Update the tasks array after adding a new task
        } catch {
            print("Error saving task: \(error)")
        }
    }
}
