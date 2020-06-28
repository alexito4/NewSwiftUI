
import SwiftUI

struct TextEditorExample: View {
    @State var fullText = "placeholder"
    
    var body: some View {
        VStack {
            TextEditor(text: $fullText)
        }
    }
}

struct AppleSignInExample: View {
    var body: some View {
        VStack {
            SignInWithAppleButton(/*@START_MENU_TOKEN@*/.signIn/*@END_MENU_TOKEN@*/,
                                                        onRequest: { request in
                                                        },
                                                        onCompletion: { result in
                                                        }
            )
            .padding()
            .frame(height: 40.0)
        }
    }
}

struct MenusExample: View {
    var body: some View {
        EmptyView()
        // macos
        //        Menu {
        //            Button("Open in Preview", action: openInPreview)
        //            Button("Save as PDF", action: saveAsPDF)
        //        } label: {
        //            Image(systemName: "document")
        //            Text("PDF")
        //        }
    }
}

struct ColorPickerExample: View {
    @State var color = Color.black
    
    var body: some View {
        VStack {
            Text("Change my color")
                .foregroundColor(color)
            ColorPicker("Change color:", selection: $color)
            ColorPicker("Change color:", selection: $color, supportsOpacity: false)
            Spacer()
        }
    }
}

struct ProgressExample: View {
    @State private var progress = 0.42
    
    var body: some View {
        VStack(spacing: 30) {
            ProgressView() // CircularProgressViewStyle
            
            Divider()
            
            Button("Up up!", action: { progress += 0.05 })
            
            ProgressView(value: progress)
            
            ProgressView("Progress", value: progress, total: 1)
            
            ProgressView(value: progress, total: 1) {
                Label("Progress", systemImage: "07.circle.fill")
            }
            
        }.padding()
    }
}

struct GaugeExample: View {
    var body: some View {
        Text("Check watchOS target")
    }
}

struct LabelExample: View {
    var body: some View {
        VStack {
            Label("Lightning", systemImage: "bolt.fill")
        }.padding()
    }
}

struct LinkExample: View {
    var body: some View {
        VStack {
            Link("Link", destination: URL(string: "https://alejandromp.com")!)
        }.padding()
    }
}

struct TextStylesExample: View {
    let start: Date
    let end: Date
    
    var body: some View {
        List {
            Text("\(start)")
            
            Text(start, style: .date)
            
            Text(start, style: .time)
            
            Text(start, style: .offset)
            
            Text(start, style: .relative)
            
            Text(start, style: .timer)
            
            Text(start...end)
            
            Text(DateInterval(start: start, duration: 4000))
        }
    }
}

struct SymbolsExamples: View {
    var body: some View {
        List {
            Image(systemName: "location.fill")
                .imageScale(.large)
            
            Text("\(Image(systemName: "location.fill")) Location")
            
            Label("Title", systemImage: "shield")
            
            HStack {
                Image(systemName: "folder.badge.plus")
                    .renderingMode(.template)
                
                Image(systemName: "folder.badge.plus")
                    .renderingMode(.template)
                    .foregroundColor(.red)
                
                Image(systemName: "folder.badge.plus")
                    .renderingMode(.original)
            }
            .imageScale(.large)
            
        }
    }
}

struct PageTabViewStyleExample: View {
    var body: some View {
        TabView {
            Text("A")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.red)
                .tabItem { Text("A") }
            
            Text("B")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.green)
                .tabItem { Text("B") }
            
            Text("C")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.yellow)
                .tabItem { Text("C") }
            
            Text("D")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.blue)
                .tabItem { Text("D") }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct ToolbarStyleExample: View {
    @State var presented = false
    
    var body: some View {
        VStack {
            Text("Toolbars")
                .padding()
            
            Button("Modal") {
                presented.toggle()
            }
        }
        .navigationBarTitle("Scren title", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up.on.square.fill")
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {}) {
                    Image(systemName: "square.and.pencil")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}) {
                    Image(systemName: "lasso")
                }
            }
            ToolbarItem(placement: .bottomBar) {
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
        .sheet(isPresented: $presented) {
            NavigationView {
                VStack {
                    Text("Presented")
                }
                .navigationBarTitle("Modal")
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Close") {
                            presented = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Confirm") {
                            presented = false
                        }
                    }
                }
            }
        }
    }
    
}

struct SidebarExample: View {
    var body: some View {
        NavigationView {
            List {
                Text("Sidebar Item 1")
                Text("Sidebar Item 2")
                Text("Sidebar Item 3")
                Text("Sidebar Item 4")
            }
            .listStyle(SidebarListStyle())
            VStack {
                Text("Main View")
            }
            VStack {
                Text("Detail view")
            }
        }
    }
}

struct GroupedListsExample: View {
    var body: some View {
        List {
            Section {
                NavigationLink(destination: newGroupedListStyleExample()) {
                    Text("Open new Inset Grouped ")
                }
            }
            Section {
                ForEach(0..<10) { _ in
                    Text("Grouped style")
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
    
    func newGroupedListStyleExample() -> some View {
        List(0..<42) { _ in
            Text("InsetGroupedListStyle")
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct Views_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TextEditorExample()
            
            AppleSignInExample()
            
            MenusExample()
            
            ColorPickerExample()
            
            ProgressExample()
            
            //            GaugeExample()
            //
            //            LabelExample()
            //
            //            LinkExample()
            //
            //            TextStylesExample(start: Date(), end: Date().advanced(by: 4000))
            
//            SymbolsExamples()
            //
            //            PageTabViewStyleExample()
//            NavigationView {
//                ToolbarStyleExample()
//            }
            
//            SidebarExample()
//                .previewDevice("iPad Pro (12.9-inch) (4th generation)")
            
            GroupedListsExample()
        }
        .previewLayout(.sizeThatFits)
    }
}
