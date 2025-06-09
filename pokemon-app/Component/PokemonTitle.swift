//
//  PokemonTitle.swift
//  Pokemon
//
//  Created by Renan Toniolo Rocha on 25/05/25.
//

import SwiftUI

struct PokemonTitle: View {
    var body: some View {
        HStack {
            Image(.pokeball)
                .frame(width: 32, height: 32, alignment: .center)
            Image(.pokedex)
                .frame(width: 106, height: 32, alignment: .center)
            Spacer()
        }
        .background(Color("Primary"))
    }
}

struct PokemonTitle_Previews: PreviewProvider {
    static var previews: some View {
        PokemonTitle()
    }
}
