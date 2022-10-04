//
//  ColorDetail.swift
//  ColorDetail
//
//  Created by Kevin Krupa on 10/12/21.
//  Copyright © 2021 Kevin Krupa. All rights reserved.
//

import SwiftUI

struct ColorDetail: View {
    
    var color: ColorStruct
    
    var body: some View {
        ZStack {
            VStack {
                Circle()
                    .fill(Color(red: color.red/255.0, green: color.green/255.0, blue: color.blue/255.0))
                    .frame(width: 300, height: 300)
                    .shadow(color: Color.black.opacity(0.5), radius: 20.0)
                    .padding(20)
                    
                Text(color.name)
                    .padding(2)
                Text("R: \(Int(color.red)) G: \(Int(color.green)) B: \(Int(color.blue))")
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color(red: color.red/255.0, green: color.green/255.0, blue: color.blue/255.0).opacity(0.3).ignoresSafeArea(.all))
    }
}

struct ColorDetail_Previews: PreviewProvider {
    static var previews: some View {
        ColorDetail(color: ColorStruct(id: 0, name: "TestColor", red: 0, green: 100, blue: 200))
    }
}
