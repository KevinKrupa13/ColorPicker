//
//  ExperimentalApp.swift
//  Experimental
//
//  Created by Kevin Krupa on 8/31/21.
//

import SwiftUI

@main
struct ExperimentalApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @Environment(\.scenePhase) private var scenePhase
    
    @State var userData = UserData()
    
    var body: some Scene {
        WindowGroup {
            ContentView(userData: userData)
        }
    }
}
