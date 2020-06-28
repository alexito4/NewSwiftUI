//
//  NewSwiftUIApp.swift
//  Shared
//
//  Created by Alejandro Martinez on 23/06/2020.
//

import SwiftUI

@main
struct NewSwiftUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

final class AppDelegate: NSObject, UIApplicationDelegate {
    
}
