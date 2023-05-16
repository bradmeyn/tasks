import SwiftUI

struct TaskDetailView: View {
    @ObservedObject var task: Task
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Detail:")
                .font(.headline)
            Text(task.detail ?? "")
            
            Text("Created:")
                .font(.headline)
            Text("\(task.created ?? Date(), formatter: taskDateFormatter)")
            
            Text("Completed:")
                .font(.headline)
            Text(task.completed ? "Yes" : "No")
            
            if task.completed {
                Text("Completed Date:")
                    .font(.headline)
                Text("\(task.completedDate ?? Date(), formatter: taskDateFormatter)")
            }
            Spacer()
        }
        .navigationTitle(task.summary ?? "")
        .navigationBarTitleDisplayMode(.large) // Make the title large
    }
    
    private let taskDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
}



