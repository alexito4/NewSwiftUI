
import SwiftUI

import MapKit
struct MapExample: View {
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 42, longitude: 2),
        latitudinalMeters: CLLocationDistance(150000),
        longitudinalMeters: CLLocationDistance(150000)
    )
    
    let data = [
        Item(id: "A", coordinate: CLLocationCoordinate2D(latitude: 42.5, longitude: 2)),
        Item(id: "B", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 2.1))
    ]
    
    var body: some View {
        VStack {
            Map(
                coordinateRegion: $region,
                interactionModes: MapInteractionModes.all,
                showsUserLocation: false,
                userTrackingMode: nil,
                annotationItems: data
            ) { item in
//            MapPin(coordinate: item.coordinate, tint: Color.red)
//            MapMarker(coordinate: item.coordinate, tint: .pink)
                MapAnnotation(coordinate: item.coordinate) {
                    Circle()
                        .stroke(Color.green, lineWidth: 4)
                        .frame(width: 100.0, height: 100.0)
                }
            }
            
        }
    }
    
    struct Item: Identifiable {
        let id: String
        let coordinate: CLLocationCoordinate2D
    }
}

#if canImport(AVKit)
import AVKit
struct VideoPlayerExample: View {
    var body: some View {
        VStack {
            VideoPlayer(player: AVPlayer(url: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4")!)) {
                Text("Custom Overlay")
                    .font(.title).foregroundColor(.white)
            }
        }.padding()
    }
}
#else
struct VideoPlayerExample: View {
    var body: some View {
        Text("AVKit not available.")
    }
}
#endif

import SpriteKit
struct SpriteKitExample: View {
    var body: some View {
        ZStack {
//            SpriteView(scene: scene)
            Button("SwiftUI Button") {}
        }
        .edgesIgnoringSafeArea(.all)
    }
}

import SceneKit
struct SceneKitExample: View {
    var body: some View {
        VStack {
//            SceneView()
            EmptyView()
        }.padding()
    }
}

#if os(iOS)
import StoreKit
struct AppStoreExample: View {
    @State var present = false
    
    var body: some View {
        VStack {
            Button("Open") {
                present = true
            }
        }
        .appStoreOverlay(isPresented: $present) {
            SKOverlay.AppConfiguration(appIdentifier: "640199958", position: .bottom)
        }
    }
}
#else
struct AppStoreExample: View {
    @State var present = false
    
    var body: some View {
        Text("StoreKit not available")
    }
}
#endif

struct Frameworks_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MapExample()
            
            VideoPlayerExample()
            
            SpriteKitExample()
            
            SceneKitExample()
            
            AppStoreExample()
        }
        .previewLayout(.sizeThatFits)
    }
}
