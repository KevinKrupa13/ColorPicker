//
//  ContentView.swift
//  Experimental
//
//  Created by Kevin Krupa on 8/31/21.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @ObservedObject var userData: UserData
    
    var body: some View {
        TabView {
            PickScreen(userData: userData)
                .tabItem {
                    Image(systemName: "paintpalette")
                    Text("Color Creator")
                }
            SavedColors(userData: userData)
                .tabItem {
                    Image(systemName: "folder")
                    Text("Saved Colors")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userData: UserData())
    }
}
