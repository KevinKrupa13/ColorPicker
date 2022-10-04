//
//  ColorItem.swift
//  ColorItem
//
//  Created by Kevin Krupa on 9/30/21.
//  Copyright © 2021 Kevin Krupa. All rights reserved.
//

import SwiftUI

struct ColorItem: View {
    
    let color: ColorStruct
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white)
                            .frame(maxWidth: 110, maxHeight: 90, alignment: .center)
                            .shadow(radius: 5)
            VStack (alignment: .center) {
                VStack (alignment: .center) {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.black, lineWidth: 2)
                        .background(Color(red: color.red/255, green: color.green/255, blue: color.blue/255))
                        .cornerRadius(15)
                        .frame(maxWidth: 96, maxHeight: 50, alignment: .center)
                }
                HStack {
                    VStack (alignment: .leading) {
                        Text(color.name)
                            .font(.system(size: 12, weight: .light, design: .serif))
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 10)
                    Spacer()
                }
            }
        }
        .frame(width: 110, height: 90, alignment: .center)
    }
}

struct ColorItem_Previews: PreviewProvider {
    static var previews: some View {
        ColorItem(color: ColorStruct(id: 0, name: "TestColor", red: 0, green: 100, blue: 200))
    }
}
