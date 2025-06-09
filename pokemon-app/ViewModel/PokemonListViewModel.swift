//
//  PokemonListViewModel.swift
//  Pokemon
//
//  Created by Renan Toniolo Rocha on 11/05/25.
//

import Foundation

final class PokemonListViewModel: ObservableObject, Sendable {
    
    // MARK: - Published
    
    @Published var pokemonList: [PokemonDTO] = []
    @Published var isLoad: Bool = false
    @Published var mesageError: String = String()
    
    // MARK: - Variables
    
    var page: Int = 0
    var id: Int = 0
    
    init() { }
    
    // MARK: - Method Public
    
    func fetchPokemonList() async {
        do {
            DispatchQueue.main.async {
                self.pokemonList = []
                self.id = 0
            }
            let pokemonList = try await NetworkCore.shared.fetchPokemonList(page: page)
            pokemonList.forEach { pokemon in
                DispatchQueue.main.async {
                    self.id += 1
                    self.pokemonList.append(PokemonDTO(id: "#\(String(format: "%03d", self.id))",
                                                       name: pokemon.name,
                                                       image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(self.id).png")
                    )
                    self.isLoad = true
                }
            }
        } catch {
            DispatchQueue.main.async {
                self.isLoad = true
                self.mesageError = error.localizedDescription
            }
        }
    }
}
