//
//  ColorStruct.swift
//  ColorStruct
//
//  Created by Kevin Krupa on 9/9/21.
//  Copyright © 2021 Kevin Krupa. All rights reserved.
//

import Foundation
import SwiftUI

struct ColorStruct: Codable, Hashable, Identifiable {
    
    var id: Int
    var name: String
    var red: Double
    var green: Double
    var blue: Double
    
}
