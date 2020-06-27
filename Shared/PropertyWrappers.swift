
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
//    @ObservedObject var state = Model()

    var body: some View {
        VStack {
            Toggle("Show", isOn: $show)
            StateObjectView()
            ObservedObjectView()
            if show {
                Text("Show")
            }
        }.padding()
    }
    
    struct StateObjectView: View {
        @StateObject var state = Model()
        
        var body: some View {
            VStack {
                Stepper("StateObject \(state.number)", value: $state.number)
            }
        }
    }
    
    struct ObservedObjectView: View {
        @ObservedObject var state = Model() // NEEDS TO MOVE UP
        
        var body: some View {
            VStack {
                Stepper("ObservedObject \(state.number)", value: $state.number)
            }
        }
    }
    
    final class Model: ObservableObject {
        @Published var number = 0
    }
}

struct NamespaceExample: View {
    var body: some View {
        List {
            NavigationLink("For geometry effect", destination: MatchedGeometryEffectExample())
            
            // TODO: for focus managment
        }
    }
}

struct StorageExample: View {
    @SceneStorage("scene") var sceneNumber = 1
    @AppStorage("app") var appNumber = 1
    
    var body: some View {
        VStack {
            Stepper("Scene", value: $sceneNumber)
            Stepper("App", value: $appNumber)
        }
    }
}

struct PropertyWrappers_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ScaledMetricExample()
            
            StateObjectExample()
            
            NamespaceExample()
            
            StorageExample()
        }
        .previewLayout(.sizeThatFits)
    }
}
