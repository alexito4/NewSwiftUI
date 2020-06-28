
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

struct FullCoverExample: View {
    @State var fullscreen = false
    @State var sheet = false

    var body: some View {
        VStack {
            Button("Open full screen cover") {
                fullscreen = true
            }
            .fullScreenCover(isPresented: $fullscreen) {
                Presented()
            }
            
            Button("Open sheet") {
                sheet = true
            }
            .sheet(isPresented: $sheet) {
                Presented()
            }
        }
    }
    
    struct Presented: View {
        @Environment(\.presentationMode) var presentationMode
        
        var body: some View {
            Text("Modal")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.gray)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
        }
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
        Text("Check the Widget example.")
    }
}

struct Modifiers_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlaceholderExample()
            
            MatchedGeometryEffectExample()
                .previewLayout(.device)
            
            FullCoverExample()
            
            EventsExample()
                .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
            
            ContainerRelativeShapeExample()
        }
        .previewLayout(.sizeThatFits)
    }
}
