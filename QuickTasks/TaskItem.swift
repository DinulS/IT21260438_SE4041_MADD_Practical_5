import Foundation

// Part A - Task Model
struct TaskItem: Identifiable {

    let id = UUID()

    var title: String
    var completed: Bool
}
