import SwiftUI

// Final Practical Task - Quick Tasks Watch App
struct ContentView: View {

    // Part B - Initial Tasks
    @State private var tasks = [
        TaskItem(title: "Morning Walk", completed: true),
        TaskItem(title: "Drink Water", completed: false),
        TaskItem(title: "Read Notes", completed: false),
        TaskItem(title: "Call Home", completed: true)
    ]

    // Part E - Completion Count
    private var completedCount: Int {
        tasks.filter { $0.completed }.count
    }

    // Part G, Option B - Progress Percentage
    private var percentComplete: Int {
        tasks.isEmpty ? 0 : completedCount * 100 / tasks.count
    }

    var body: some View {

        // Part C - Main Screen
        NavigationStack {

            List {

                VStack(spacing: 4) {

                    Text("\(completedCount) / \(tasks.count) Completed")
                        .font(.headline)
                        .accessibilityIdentifier("completedCount")

                    ProgressView(value: Double(percentComplete), total: 100)
                        .tint(.green)

                    Text("\(percentComplete)% Complete")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .accessibilityIdentifier("percentComplete")
                }
                .listRowBackground(Color.clear)

                // Part D - tapping a task toggles it
                ForEach($tasks) { $task in

                    Button {
                        task.completed.toggle()
                    } label: {
                        TaskRow(task: task)
                    }
                    .accessibilityIdentifier("toggle-\(task.title)")
                    .accessibilityValue(task.completed ? "Completed" : "Pending")
                }

                // Part F - details are a separate, labelled row so the toggle button is never inside a link
                Section("Task Details") {

                    ForEach(tasks) { task in

                        NavigationLink {
                            TaskDetailView(task: task)
                        } label: {
                            Label(task.title, systemImage: "info.circle")
                                .font(.footnote)
                        }
                        .accessibilityIdentifier("details-\(task.title)")
                    }
                }
            }
            .navigationTitle("Quick Tasks")
        }
    }
}

#Preview {
    ContentView()
}
