
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
    @State var color = Color.black
    
    var body: some View {
        VStack {
            ProgressView("Progress", value: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, total: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
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

struct Views_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TextEditorExample()
            
            AppleSignInExample()
            
            MenusExample()
            
            ColorPickerExample()
            
            ProgressExample()
            
            GaugeExample()
            
            LabelExample()
            
            LinkExample()
        }
        .previewLayout(.sizeThatFits)
    }
}
