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
    @Published var searchText: String = String() {
        didSet {
            filteredPokemonList()
        }
    }
    
    // MARK: - Variables
    
    let urlImg: String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
    var page: Int = 0
    var id: Int = 0
    var orderDesc: Bool = true
    var oldList: [PokemonDTO] = []
    
    // MARK: - Constructor
    
    init() { }
    
    // MARK: - Method Public
    
    func fetchPokemonList() async {
        do {
            DispatchQueue.main.async {
                self.pokemonList = []
                self.id = 0
            }
            let list = try await NetworkCore.shared.fetchPokemonList(page: page)
            list.forEach { pokemon in
                DispatchQueue.main.async {
                    self.id += 1
                    let pokemon = PokemonDTO(id: self.id,
                                             code: "#\(String(format: "%03d", self.id))",
                                             name: pokemon.name,
                                             image: "\(self.urlImg)\(self.id).png")
                    self.pokemonList.append(pokemon)
                    self.oldList.append(pokemon)
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
    
    func pokemonOrderByName() {
        if orderDesc {
            orderDesc = false
            pokemonList.sort { $0.name < $1.name }
        } else {
            orderDesc = true
            pokemonList.sort { $0.name > $1.name }
        }
    }
    
    // MARK: - Method Private
    
    private func filteredPokemonList() {
        if !searchText.isEmpty {
            let list = pokemonList
            pokemonList = list.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        } else {
            pokemonList = oldList
        }
    }
}
