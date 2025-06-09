//
//  RoundIconButton.swift
//  Pokemon
//
//  Created by Renan Toniolo Rocha on 24/05/25.
//

import SwiftUI

struct RoundIconButton: View {
    var body: some View {
        Button(action: {
            // ação do botão
            print("Botão pressionado")
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

struct RoundIconButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundIconButton()
    }
}
