import SwiftUI

// Exercise 04 - Improve the Controls with SF Symbols
struct Exercise04View: View {

    @State private var glasses = 0

    var body: some View {

        ScrollView {

            VStack(spacing: 10) {

                Image(systemName: "drop.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.blue)

                Text("\(glasses) Glasses")
                    .font(.headline)

                Button {
                    glasses += 1
                } label: {

                    Label(
                        "Add Water",
                        systemImage: "plus.circle.fill"
                    )
                }

                Button {
                    glasses = 0
                } label: {

                    Label(
                        "Reset",
                        systemImage: "arrow.counterclockwise"
                    )
                }
            }
        }
    }
}

#Preview {
    Exercise04View()
}
