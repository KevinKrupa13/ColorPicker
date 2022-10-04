//
//  UserData.swift
//  UserData
//
//  Created by Kevin Krupa on 9/30/21.
//  Copyright © 2021 Kevin Krupa. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

final class UserData: ObservableObject {
    @Published var colorArray = [ColorStruct]()
    var color = ColorGrab(color: Color(red: 0, green: 0, blue: 0), red: -1.0, green: -1.0, blue: -1.0)
    
    init() {
        getArray()
    }
    
    func saveGrab(colorG: ColorGrab) {
        color = colorG
    }
    
    func getArray() {
        if let data = UserDefaults.standard.data(forKey: "colorArray") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                colorArray = try decoder.decode([ColorStruct].self, from: data)

            } catch {
                print("Unable to Decode Colors (\(error))")
            }
        }
    }

    func saveArray() {
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(colorArray)

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: "colorArray")

        } catch {
            print("Unable to Encode Colors (\(error))")
        }
    }

    func saveColor(color: ColorStruct) {
        var newColor = color
        if (colorArray.isEmpty) {
            newColor.id = 0
        } else {
            newColor.id = colorArray.count
        }
        colorArray.append(newColor)
        saveArray()
        
        print("Saved")
    }

    func emptyArray() {
        colorArray = [ColorStruct]()
        saveArray()
    }

    func deleteColor(id: Int) {
        if (id < colorArray.count) {
            colorArray.remove(at: id)
            saveArray()
        }
    }
}

