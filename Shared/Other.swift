
import Foundation
import SwiftUI

struct ExportExample: View {
    @Environment(\.exportFiles) var export
    
    var body: some View {
        Button("Export") {
            exportFile()
        }
    }
    
    func exportFile() {
//        export(moving: "path to file") { result in
//            print(result)
//        }
    }
}
