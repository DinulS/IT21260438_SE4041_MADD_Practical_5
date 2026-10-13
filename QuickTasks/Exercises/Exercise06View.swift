import SwiftUI

// Exercise 05 - the TaskItem model is in TaskItem.swift
// Exercise 06 - Display a List
struct Exercise06View: View {

    @State private var tasks = [

        TaskItem(
            title: "Morning Walk",
            completed: true
        ),

        TaskItem(
            title: "Drink Water",
            completed: false
        ),

        TaskItem(
            title: "Read Notes",
            completed: false
        )
    ]

    var body: some View {

        List(tasks) { task in

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
}

#Preview {
    Exercise06View()
}
