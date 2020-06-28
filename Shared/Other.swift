
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
        let fm = FileManager.default
        let directory = fm.urls(for: .documentDirectory, in: .userDomainMask).first!
        let path = directory.appendingPathComponent("example.txt")
        try! "Example".write(toFile: path.absoluteString, atomically: true, encoding: .utf8)
        export(moving: path) { result in
            print(result)
        }
    }
}
