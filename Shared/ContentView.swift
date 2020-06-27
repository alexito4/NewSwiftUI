//
//  ContentView.swift
//  Shared
//
//  Created by Alejandro Martinez on 23/06/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State var color = Color.red
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Views")) {
                    TextEditorExample().nl("Text Editor")
                    AppleSignInExample().nl("Apple Sign In")
                    MenusExample().nl("Menus")
                    ColorPickerExample().nl("Color picker")
                    ProgressExample().nl("Progress")
                    GaugeExample().nl("Gauge (watchOS)")
                    LabelExample().nl("Label")
                    LinkExample().nl("Link")
                    TextStylesExample(start: Date(), end: Date().advanced(by: 4000)).nl("Text Styles")
                    PageTabViewStyleExample().nl("Paged Tab Style")
                }
                Section(header: Text("Other System Frameworks")) {
                    VideoPlayerExample().nl("Video player")
                    MapExample().nl("Map")
                    SpriteKitExample().nl("SpriteKit")
                    SceneKitExample().nl("SceneKit")
                    AppStoreExample().nl("App Store Overlay with StoreKit")
                }
                Section(header: Text("Layout")) {
                    LazyStacksExample().nl("Lazy stacks")
                    PinnedViewsExample().nl("Pinned views")
                    GridsExample().nl("Grids")
                    ScrollViewExample().nl("ScrollView")
                    OutlineGroupExample().nl("Outline Group")
                    DisclosureGroupExample().nl("Disclosure Group")
                }
                Section(header: Text("Modifiers")) {
                    PlaceholderExample().nl("isPlaceholder (not in beta 1)")
                    MatchedGeometryEffectExample().nl("matchedGeometryEffect 🤯")
                    EventsExample().nl("Events")
                    ContainerRelativeShapeExample().nl("Container corners (in the widget)")
                }
                Section(header: Text("Property Wrappers")) {
                    ScaledMetricExample().nl("@ScaledMetric")
                    StateObjectExample().nl("@StateObject")
                    NamespaceExample().nl("@Namespace")
                    StorageExample().nl("Storage")
                }
            }
            .navigationBarTitle("What's new in SwiftUI", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
    }
}

struct Library: LibraryContentProvider {
    
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(
            VStack {
                Text("Library Example")
                Image(systemName: "book")
            },
            title: "Library Example",
            category: .control
        )
    }
}

extension View {
    func nl(_ title: String) -> some View {
        NavigationLink(title, destination: self)
    }
}
