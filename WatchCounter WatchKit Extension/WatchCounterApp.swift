//
//  WatchCounterApp.swift
//  WatchCounter WatchKit Extension
//
//  Created by Kevin Escobedo on 4/9/21.
//

import SwiftUI

@main
struct WatchCounterApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
