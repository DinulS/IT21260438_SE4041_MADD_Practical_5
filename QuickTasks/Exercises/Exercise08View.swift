import SwiftUI

// Exercise 08 - Toggle Task Status and Display a Completion Count
struct Exercise08View: View {

    @State private var tasks = [
        TaskItem(title: "Morning Walk", completed: true),
        TaskItem(title: "Drink Water", completed: false),
        TaskItem(title: "Read Notes", completed: false)
    ]

    private var completedCount: Int {
        tasks.filter { $0.completed }.count
    }

    var body: some View {

        VStack {

            Text(
                "\(completedCount)/\(tasks.count) Completed"
            )
            .font(.caption)

            List(tasks.indices, id: \.self) { index in

                Button {

                    tasks[index].completed.toggle()

                } label: {

                    HStack {

                        Image(
                            systemName:
                                tasks[index].completed
                                ? "checkmark.circle.fill"
                                : "circle"
                        )

                        Text(tasks[index].title)

                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    Exercise08View()
}
