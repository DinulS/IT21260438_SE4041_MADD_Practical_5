import SwiftUI

// Exercise 07 - Navigation to TaskDetailView
struct Exercise07View: View {

    @State private var tasks = [
        TaskItem(title: "Morning Walk", completed: true),
        TaskItem(title: "Drink Water", completed: false),
        TaskItem(title: "Read Notes", completed: false)
    ]

    var body: some View {

        NavigationStack {

            List(tasks) { task in

                NavigationLink {

                    TaskDetailView(task: task)

                } label: {

                    HStack {

                        Image(
                            systemName:
                                task.completed
                                ? "checkmark.circle.fill"
                                : "circle"
                        )

                        Text(task.title)
                    }
                }
            }
            .navigationTitle("Tasks")
        }
    }
}

#Preview {
    Exercise07View()
}
