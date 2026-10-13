import SwiftUI

// Exercise 02 - Simple Layout
struct Exercise02View: View {

    var body: some View {

        VStack(spacing: 10) {

            Image(systemName: "figure.walk")
                .font(.largeTitle)
                .foregroundStyle(.green)

            Text("Daily Activity")
                .font(.headline)

            Text("5,240")
                .font(.title)
                .bold()

            Text("Steps")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    Exercise02View()
}
