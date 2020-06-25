
import SwiftUI


struct PlaceholderExample: View {
    var body: some View {
        VStack {
            Text("Real content")
            Image(systemName: "circle.fill")
                .foregroundColor(.red)
        }
        .padding()
        .background(Color.gray)
        .cornerRadius(10)
        // .isPlaceholder(true) // NOT IN BETA 1
    }
}

struct Modifiers_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderExample()
    }
}
