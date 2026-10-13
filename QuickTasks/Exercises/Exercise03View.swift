import SwiftUI

// Exercise 03 - @State and Button Interaction, with the Reset button
struct Exercise03View: View {

    // Owned by this view; not saved between launches
    @State private var glasses = 0

    var body: some View {

        VStack(spacing: 10) {

            Image(systemName: "drop.fill")
                .font(.largeTitle)
                .foregroundStyle(.blue)

            Text("Water")
                .font(.headline)

            Text("\(glasses)")
                .font(.largeTitle)
                .bold()

            Text("Glasses")
                .font(.caption)

            Button("Add") {
                glasses += 1
            }

            Button("Reset") {
                glasses = 0
            }
        }
    }
}

#Preview {
    Exercise03View()
}
