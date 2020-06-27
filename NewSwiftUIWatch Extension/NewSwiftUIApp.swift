//
//  NewSwiftUIApp.swift
//  NewSwiftUIWatch Extension
//
//  Created by Alejandro Martinez on 27/06/2020.
//

import SwiftUI

@main
struct NewSwiftUIApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
