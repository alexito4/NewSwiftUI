
import SwiftUI

struct PreviewExample: View {
    @State var number = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6.0) {
            Text("Example")
            Text("Another example")
            Button("incre") {
                number += 1
            }
        }
        .padding(.trailing)
        .padding(.all, 15)
    }
    
}

struct PreviewExample_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PreviewExample()
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .accessibilityMedium)
                .previewLayout(.sizeThatFits)
            
            PreviewExample()
                .preferredColorScheme(.light)
                .environment(\.sizeCategory, .accessibilityMedium)
                .previewLayout(.sizeThatFits)
        }
    }
}

