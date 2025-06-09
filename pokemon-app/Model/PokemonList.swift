//
//  PokemonList.swift
//  Pokemon
//
//  Created by Renan Toniolo Rocha on 18/05/25.
//

import Foundation

// MARK: - PokemonList

struct PokemonList: Decodable {
    let results: [PokemonListItem]
}

// MARK: - PokemonListItem

struct PokemonListItem: Decodable {
    let name: String
}


