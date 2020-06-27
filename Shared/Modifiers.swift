
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

struct MatchedGeometryEffectExample: View {
    @State var display = false
    @Namespace var example
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text("The same text")
                        .matchedGeometryEffect(id: "text", in: example)
                }
                .padding()
                .background(Color.gray)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                
                if display {
                    VStack {
                        Text("This is a new screen")
                        
                        Image(systemName: "lock")
                            .foregroundColor(.green)
                            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                        
                        Text("The same text")
                            .matchedGeometryEffect(id: "text", in: example)

                        Spacer()
                    }
                    .padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .transition(.move(edge: .bottom))
                } else {
                    Spacer()
                }
            }
            Button(action: { withAnimation {
                display.toggle()
            } }) {
                Image(systemName: "circle.fill")
                    .foregroundColor(.red)
            }
        }
        .background(Color.gray)
    }
}

import Combine
class EventsModel: ObservableObject {
    
    @Published var date: Date = Date()
    
    private var cancellable: AnyCancellable?
    
    func start() {
        cancellable = Timer.TimerPublisher(interval: 1.0, runLoop: .main, mode: .default)
            .autoconnect()
            .sink(receiveValue: { date in
                self.date = date
            })
    }
    
    func stop() {
        cancellable?.cancel()
    }
}
struct EventsExample: View {
    @ObservedObject var model = EventsModel()
    @State var number = 0
    
    var body: some View {
        VStack {
            Button("Change") {
                number += 1
            }
            Text("\(number)")
            
            HStack {
                Button("Start") {
                    model.start()
                }
                Button("Stop") {
                    model.stop()
                }
            }
        }
        .onReceive(model.$date) { date in
            print("onReceive: \(date)")
        }
        .onChange(of: number) { value in
            print("Number changed \(value)")
        }
        .onOpenURL { url in
            print("URL opened")
        }
        .onContinueUserActivity("type") { activity in
            print("Continue user activity")
        }
    }
}

struct ContainerRelativeShapeExample: View {
    var body: some View {
        ZStack {
            Color.gray
            
            VStack {
                Text("Inside the card")
                
                VStack {
                    Text("Another stack")
                    Image(systemName: "6.circle")
                }
                .padding()
                .background(ContainerRelativeShape().fill(Color.gray))
//                .cornerRadius(5)
                
            }
            .padding(5.0)
            .background(Color.purple)
            .contentShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .cornerRadius(10)
        }
    }
}

struct Modifiers_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlaceholderExample()
            
            MatchedGeometryEffectExample()
                .previewLayout(.device)
            
            EventsExample()
                .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
            
            ContainerRelativeShapeExample()
        }
        .previewLayout(.sizeThatFits)
    }
}
