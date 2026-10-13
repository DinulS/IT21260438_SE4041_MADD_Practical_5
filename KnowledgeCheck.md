# Practical 05 - Knowledge Check

1. **Watch-only app:** A watchOS app that runs on its own on Apple Watch, without an iPhone companion app.
2. **`@main`:** Marks the app's starting point. Here it is the `QuickTasksApp` struct, which conforms to `App`.
3. **`WindowGroup`:** The scene that holds the app's initial view, `ContentView()`.
4. **Why less information on watch screens:** The screen is very small and people only glance at it for a few seconds, so each screen should show only the important information and one or two quick actions.
5. **`@State`:** Stores a value owned by the view that can change while the app runs (e.g. `glasses` or `tasks`). It is not saved between launches.
6. **Why SwiftUI updates the interface automatically:** The UI is declared as a function of its state. When a `@State` value changes, SwiftUI recomputes `body` and redraws only what changed.
7. **SF Symbol:** One of Apple's built-in system icons, e.g. `Image(systemName: "checkmark.circle.fill")`, styled like text.
8. **What `Identifiable` provides:** A unique, stable `id` for each `TaskItem`, so `List` and `ForEach` can tell the items apart.
9. **Why `List` is useful on Apple Watch:** It gives a native scrolling list that works with the Digital Crown and touch, with large, easy-to-tap rows. It is richer than the old WatchKit tables.
10. **`NavigationStack`:** Manages a stack of screens, with a title and a back button, so the app can move between the list and detail screens.
11. **`NavigationLink`:** A tappable row that pushes a destination view, such as `TaskDetailView`, onto the navigation stack.
12. **`.toggle()`:** Flips a `Bool`: `false` becomes `true` and `true` becomes `false`. It is used to mark a task as completed or incomplete.
13. **`filter` in the completion count:** `tasks.filter { $0.completed }` keeps only completed tasks, and `.count` gives how many there are.
