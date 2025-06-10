//
//  RoundTextField.swift
//  Pokemon
//
//  Created by Renan Toniolo Rocha on 24/05/25.
//

import SwiftUI

struct RoundTextField: View {
    @Binding var text: String
    var body: some View {
        TextField(PokemonStrings.search.localized(),
                  text: $text)
        .frame(height: 32)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .cornerRadius(16)
        .shadow(radius: 1)
    }
}
