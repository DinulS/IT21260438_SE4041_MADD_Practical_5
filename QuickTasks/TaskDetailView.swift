import SwiftUI

// Part F - Task Detail Screen
struct TaskDetailView: View {

    let task: TaskItem

    var body: some View {

        VStack(spacing: 10) {

            Image(
                systemName:
                    task.completed
                    ? "checkmark.circle.fill"
                    : "circle"
            )
            .font(.largeTitle)
            .foregroundStyle(task.completed ? Color.green : .secondary)

            Text(task.title)
                .font(.headline)
                .multilineTextAlignment(.center)

            Text(
                task.completed
                ? "Completed"
                : "Pending"
            )
            .font(.caption)
            .foregroundStyle(task.completed ? Color.green : .orange)
            .accessibilityIdentifier("taskStatus")
        }
        .navigationTitle("Details")
    }
}

#Preview {
    NavigationStack {
        TaskDetailView(task: TaskItem(title: "Morning Walk", completed: true))
    }
}
