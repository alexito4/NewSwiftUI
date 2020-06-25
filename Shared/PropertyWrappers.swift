
import SwiftUI


struct ScaledMetricExample: View {
    var spacing: CGFloat = 10
    
    var body: some View {
        VStack {
            
            ScaledView()
            
            ScaledView()
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
            
            NotScaledView()
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        }.padding()
    }
    
    struct ScaledView: View {
        @ScaledMetric var spacing: CGFloat = 10
        
        var body: some View {
            Group {
                Text("Spacing of 10")
                
                HStack(spacing: spacing) {
                    Text("A").background(Color.red)
                    Text("B").background(Color.green)
                }
            }
        }
    }
    
    struct NotScaledView: View {
        var spacing: CGFloat = 10
        
        var body: some View {
            Group {
                Text("Spacing of 10")
                
                HStack(spacing: spacing) {
                    Text("A").background(Color.red)
                    Text("B").background(Color.green)
                }
            }
        }
    }
}

struct StateObjectExample: View {
    
    @State var show = true
    
    var body: some View {
        VStack {
            Toggle("Show", isOn: $show)
            if show {
                StateView()
            }
        }.padding()
    }
    
    struct StateView: View {
        @ObservedObject var observed = Model()
        @StateObject var state = Model() // TODO: should keep the state but it doesn't?
        
        var body: some View {
            VStack {
                Stepper("ObservedObject \(observed.number)", value: $observed.number)
                Stepper("StateObject \(state.number)", value: $state.number)
            }
        }
    }
    
    final class Model: ObservableObject {
        @Published var number = 0
    }
}



struct PropertyWrappers_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ScaledMetricExample()
            
            StateObjectExample()
        }
    }
}
