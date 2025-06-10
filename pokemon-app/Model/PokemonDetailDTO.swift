//
//  PokemonDetailDTO.swift
//  Pokemon
//
//  Created by Renan Toniolo Rocha on 08/06/25.
//

import Foundation

// MARK: - PokemonDetailDTO

struct PokemonDetailDTO: Identifiable {
    let id: Int
    let name: String
    let image: URL
    let height: Int
    let isDefault: Bool?
    let order: Int
    let stats: [StatDetail]
    let type: [TypeElementDetail]
    let weight: Int
}

// MARK: - TypeElementDetail

struct TypeElementDetail {
    let slot: Int
    let type: Species
}

// MARK: - StatDetail

struct StatDetail: Identifiable {
    let id = UUID()
    let statValue: Int
    let name: String
}
