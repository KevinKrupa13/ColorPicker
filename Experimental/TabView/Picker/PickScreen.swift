//
//  PickScreen.swift
//  PickScreen
//
//  Created by Kevin Krupa on 10/12/21.
//  Copyright © 2021 Kevin Krupa. All rights reserved.
//

import SwiftUI
import UIKit

struct PickScreen: View {
    
    @ObservedObject var userData: UserData
    
    @State private var redC = ""
    @State private var greenC = ""
    @State private var blueC = ""
    
    @State private var redV = 0.0
    @State private var greenV = 0.0
    @State private var blueV = 0.0
    
    @State private var isEditing = false
    
    let hexValues = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                VStack {
                    TextField("255", text: $redC) { editing in
                        isEditing = editing
                        redV = (redC as NSString).doubleValue
                    } onCommit: {
                        redV = (redC as NSString).doubleValue
                    }
                    TextField("255", text: $greenC) { editing in
                        isEditing = editing
                        greenV = (greenC as NSString).doubleValue
                    } onCommit: {
                        greenV = (greenC as NSString).doubleValue
                    }
                    TextField("255", text: $blueC) { editing in
                        isEditing = editing
                        blueV = (blueC as NSString).doubleValue
                    } onCommit: {
                        blueV = (blueC as NSString).doubleValue
                    }
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(.black, lineWidth: 2)
                        .background(Color(red: redV/255, green: greenV/255, blue: blueV/255))
                        .cornerRadius(25)
                        .frame(width: 125, height: 125)
                }
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .font(.system(size: 55, weight: .heavy, design: .default))
                Spacer()
                Button(action: {
                    userData.saveColor(color: ColorStruct(id: 0, name: "#" + getHex(double: redV) + getHex(double: greenV) + getHex(double: blueV), red: redV, green: greenV, blue: blueV))
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
        }
        .background(Color(red: redV/255, green: greenV/255, blue: blueV/255).opacity(0.4).ignoresSafeArea(.all))
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

struct PickScreen_Previews: PreviewProvider {
    static var previews: some View {
        PickScreen(userData: UserData())
    }
}
