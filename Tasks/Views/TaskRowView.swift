import SwiftUI

struct TaskRowView: View {
    @ObservedObject var task: Task
    
    var body: some View {
        NavigationLink(destination: TaskDetailView(task: task)) {
            VStack(alignment: .leading) {
                Text(task.summary ?? "")
                    .font(.headline)
                Text(task.detail ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
