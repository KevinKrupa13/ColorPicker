//
//  AppDelegate.swift
//  AppDelegate
//
//  Created by Kevin Krupa on 9/21/21.
//  Copyright © 2021 Kevin Krupa. All rights reserved.
//

import SwiftUI
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let userData = UserData()
        userData.getArray()
        
        return true
    }

}
