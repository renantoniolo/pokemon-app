//
//  PokemonDetailDTO.swift
//  Pokemon
//
//  Created by Renan Toniolo Rocha on 08/06/25.
//

import Foundation

// MARK: - PokemonDetailDTO

struct PokemonDetailDTO: Identifiable {
    let id: String
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

//// MARK: - SpeciesDetail
//
//struct SpeciesDetail {
//    let name: String
//    let url: String
//}

// MARK: - StatDetail

struct StatDetail: Identifiable {
    let id = UUID()
    let baseStat: Int
    let effort: Int
    let stat: Species
}
