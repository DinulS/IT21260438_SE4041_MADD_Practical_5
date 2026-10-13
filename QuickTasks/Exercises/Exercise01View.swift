import SwiftUI

// Exercise 01 - Your First Watch Interface
struct Exercise01View: View {

    var body: some View {

        VStack(spacing: 8) {

            Image(systemName: "applewatch")
                .font(.title)

            Text("SE4041")
                .font(.headline)
                .bold()

            Text("watchOS")
                .font(.caption)
        }
    }
}

#Preview {
    Exercise01View()
}
