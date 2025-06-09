//
//  Pokemon.swift
//  Pokemon
//
//  Created by Renan Toniolo Rocha on 11/05/25.
//

import Foundation

// MARK: - Pokemon
struct Pokemon: Codable {
    let id: Int
    let name: String
    let height: Int
    let isDefault: Bool?
    let order: Int
    let stats: [Stat]
    let types: [TypeElement]
    let weight: Int

}

// MARK: - TypeElement
struct TypeElement: Codable {
    let slot: Int
    let type: Species
}

// MARK: - Stat
struct Stat: Codable {
    let baseStat: Int
    let effort: Int
    let stat: Species

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

// MARK: - Species
struct Species: Codable {
    let name: String
    let url: String
}
