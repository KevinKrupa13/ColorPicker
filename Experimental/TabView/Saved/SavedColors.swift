//
//  SavedColors.swift
//  SavedColors
//
//  Created by Kevin Krupa on 9/16/21.
//  Copyright © 2021 Kevin Krupa. All rights reserved.
//

import SwiftUI

struct SavedColors: View {
    
    @State @ObservedObject var userData: UserData
    let columns = [ GridItem(.adaptive(minimum: 110, maximum: 110))]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    ZStack {
                        LazyVGrid(columns: columns, spacing: 1) {
                            ForEach(userData.colorArray, id: \.self) { color in
                                NavigationLink(destination: ColorDetail(color: color)) {
                                    ColorItem(color: color)
                                        .padding(.vertical, 2.5)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(("Saved Colors"), displayMode: .inline)
        }
    }
}

struct SavedColors_Previews: PreviewProvider {
    static var previews: some View {
        SavedColors(userData: UserData())
    }
}
