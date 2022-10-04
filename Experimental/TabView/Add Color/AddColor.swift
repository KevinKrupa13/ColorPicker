//
//  AddColor.swift
//  AddColor
//
//  Created by Kevin Krupa on 11/30/21.
//  Copyright © 2021 Kevin Krupa. All rights reserved.
//

import SwiftUI

struct AddColor: View {
    
    @ObservedObject var userData: UserData
    let color: ColorGrab
    
    let hexValues = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                VStack {
                    Text("\(Int(color.red * 255))")
                    Text("\(Int(color.green * 255))")
                    Text("\(Int(color.blue * 255))")
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(.black, lineWidth: 2)
                        .background(Color(red: color.red, green: color.green, blue: color.blue))
                        .cornerRadius(25)
                        .frame(width: 125, height: 125)
                }
                .multilineTextAlignment(.center)
                .font(.system(size: 55, weight: .heavy, design: .default))
                Spacer()
                Button(action: {
                    userData.saveColor(color: ColorStruct(id: 0, name: "#" + getHex(double: color.red * 255) + getHex(double: color.green * 255) + getHex(double: color.blue * 255), red: color.red * 255, green: color.green * 255, blue: color.blue * 255))
                }) {
                    Text("Save Color")
                        .padding()
                        .foregroundColor(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .strokeBorder(lineWidth: 2)
                                .foregroundColor(.black)
                        )
                }
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width)
        }
        .background(Color(red: color.red, green: color.green, blue: color.blue).opacity(0.4).ignoresSafeArea(.all))
    }
    
    public func getHex(double: Double) -> String {
        var value = 0.0
        if (double > 255.0) {
            value = 255.0
        } else if (double < 0) {
            value = 0
        } else {
            value = double
        }
        var hexValue = ""
        let product = (value / 16)
        let firstProduct = product.rounded(.towardZero)
        let remainderSolid = ((product - firstProduct) * 16).rounded(.towardZero)
        
        hexValue += hexValues[(Int)(firstProduct)]
        hexValue += hexValues[(Int)(remainderSolid)]
        
        return hexValue
    }
}

struct AddColor_Previews: PreviewProvider {
    static var previews: some View {
        AddColor(userData: UserData(), color: ColorGrab(color: Color(red: 0/255, green: 100/255, blue: 200/255), red: 0/255, green: 100/255, blue: 200/255))
    }
}
