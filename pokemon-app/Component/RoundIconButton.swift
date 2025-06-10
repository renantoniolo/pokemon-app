//
//  RoundIconButton.swift
//  Pokemon
//
//  Created by Renan Toniolo Rocha on 24/05/25.
//

import SwiftUI

struct RoundIconButton: View {
    let orderBy: () -> Void
    
    var body: some View {
        Button(action: {
            orderBy()
        }) {
            Image(systemName: "textformat")
                .foregroundColor(.red)
                .font(.system(size: 14))
                .padding()
        }
        .frame(width: 32, height: 32)
        .background(Circle().fill(Color("White")))
    }
}
