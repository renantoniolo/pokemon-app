//
//  PokemonDTO.swift
//  Pokemon
//
//  Created by Renan Toniolo Rocha on 11/05/25.
//

import Foundation

// MARK: - PokemonDTO

struct PokemonDTO: Identifiable {
    let id: Int
    let code: String
    let name: String
    let image: String
}
