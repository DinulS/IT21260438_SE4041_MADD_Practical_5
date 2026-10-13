import SwiftUI

// Reusable row subview for a task
struct TaskRow: View {

    let task: TaskItem

    var body: some View {

        HStack {

            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(task.completed ? Color.green : .secondary)

            Text(task.title)
                .strikethrough(task.completed)

            Spacer()
        }
    }
}

#Preview {
    List {
        TaskRow(task: TaskItem(title: "Morning Walk", completed: true))
        TaskRow(task: TaskItem(title: "Drink Water", completed: false))
    }
}
