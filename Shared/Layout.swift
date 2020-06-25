
import SwiftUI

struct LazyStacksExample: View {
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(1...100, id: \.self) {
                                Text("Column \($0)")
                                    .background(Color.secondary)
                            }
                        }
                        .padding(.vertical, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                    ForEach(1...100, id: \.self) {
                        Text("Row \($0)")
                            .padding()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .background(Color.secondary)
                    }
                }
            }
        }
    }
}

struct PinnedViewsExample: View {
    var body: some View {
        return EmptyView() // TODO: ??
        NavigationLink("PinnedScrollableViews", destination: VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(1...100, id: \.self) {
                                Text("Column \($0)")
                                    .background(Color.secondary)
                            }
                        }
                        .padding(.vertical, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                    ForEach(1...100, id: \.self) {
                        Text("Row \($0)")
                            .padding()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .background(Color.secondary)
                    }
                }
            }
        })
    }
}

struct GridsExample: View {
    var body: some View {
        let rows: [GridItem] =
            Array(repeating: .init(.fixed(20)), count: 2)
        
        return VStack {
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, alignment: .top) {
                    ForEach((0...79), id: \.self) {
                        let codepoint = $0 + 0x1f600 // <-- INLINE VARIABLES!
                        let codepointString = String(format: "%02X", codepoint)
                        Text("\(codepointString)")
                            .font(.footnote)
                        let emoji = String(Character(UnicodeScalar(codepoint)!))
                        Text("\(emoji)")
                            .font(.largeTitle)
                    }
                }
            }
        }
    }
}

struct ScrollViewExample: View {
    var content = [
        Color.black,
        .gray,
        .red,
        .green,
        .blue,
        .orange,
        .yellow,
        .pink,
        .purple,
        .primary,
        .secondary
    ]
    
    @State var index = 0
    
    var body: some View {
        VStack {
            GeometryReader { gp in
                ScrollViewReader { sp in
                    ZStack(alignment: .bottom) {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(0..<content.count) { i in
                                    content[i]
                                        .frame(width: gp.size.width, height: gp.size.height)
                                        .id(i)
                                }
                            }
                        }
                        
                        HStack {
                            Button("Previous") {
                                index -= 1
                                sp.scrollTo(index)
                            }
                            Button("Next") {
                                index += 1
                                sp.scrollTo(index)
                            }
                        }
                    }
                }
                
            }
        }
    }
}

struct OutlineGroupExample: View {
    struct FileItem: Hashable, Identifiable, CustomStringConvertible {
        var id: Self { self }
        var name: String
        var children: [FileItem]? = nil
        var description: String {
            switch (children) {
            case nil:
                return "📄 \(name)"
            case .some(let children):
                return children.count > 0 ? "📂 \(name)" : "📁 \(name)"
            }
        }
    }

    let data =
      FileItem(name: "users", children:
        [FileItem(name: "user1234", children:
          [FileItem(name:"Photos", children:
            [FileItem(name: "photo001.jpg"),
             FileItem(name: "photo002.jpg")]),
           FileItem(name:"Movies", children:
             [FileItem(name: "movie001.mp4")]),
              FileItem(name:"Documents", children: [])
          ]),
         FileItem(name: "newuser", children:
           [FileItem (name: "Documents", children: [])
           ])
        ])
    
    var body: some View {
        VStack {
            OutlineGroup(data, children: \.children) { item in
                Text("\(item.description)")
            }
            Spacer()
        }
    }
}

struct DisclosureGroupExample: View {
    struct ToggleStates {
        var oneIsOn: Bool = false
        var twoIsOn: Bool = true
    }
    @State private var toggleStates = ToggleStates()
    @State private var topExpanded: Bool = true
    
    var body: some View {
        VStack {
            DisclosureGroup("Items", isExpanded: $topExpanded) {
                Toggle("Toggle 1", isOn: $toggleStates.oneIsOn)
                Toggle("Toggle 2", isOn: $toggleStates.twoIsOn)
                DisclosureGroup("Sub-items") {
                    Text("Sub-item 1")
                }
            }.padding()
            Spacer()
        }
    }
}

struct Layout_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LazyStacksExample()
            
            PinnedViewsExample()
            
            GridsExample()
            
            ScrollViewExample()
            
            OutlineGroupExample()
            
            DisclosureGroupExample()
        }
        .previewLayout(.sizeThatFits)
    }
}
