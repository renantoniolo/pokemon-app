//
//  NetoworkCore.swift
//  Pokemon
//
//  Created by Renan Toniolo Rocha on 11/05/25.
//

import Foundation

// MARK: - Erros
enum ErrosNetwork: Error {
    case convertError
    case networkError
}

final class NetworkCore {
    
    // MARK: - Singleton
    static let shared = NetworkCore()
    
    // MARK: - Private
    private let urlStringListBase: String = "https://pokeapi.co/api/v2/pokemon?limit=100&offset=0"
    private let urlStringDetailBase: String = "https://pokeapi.co/api/v2/pokemon/"

    // MARK: - Construtor
    private init() { }
    
    
    // MARK: - Method Public
    
    /// get all list pokemons
    /// page: Int
    func fetchPokemonList(page: Int) async throws -> [PokemonListItem] {
        guard let url = URL(string: urlStringListBase) else {
            throw ErrosNetwork.convertError
        }
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            let pokemonList = try JSONDecoder().decode(PokemonList.self, from: data)
            return pokemonList.results
        } catch {
            throw ErrosNetwork.networkError
        }
    }
    
    /// Get pokemon detail
    /// name: String
    func fetchPokemon(id: Int) async throws -> Pokemon {
        let urlString = "\(urlStringDetailBase)\(id)"
        guard let url = URL(string: urlString) else {
            throw ErrosNetwork.convertError
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
            return pokemon
        } catch {
            throw ErrosNetwork.networkError
        }
    }
}
