//
//  PokemonDetailViewModel.swift
//  Pokemon
//
//  Created by Renan Toniolo Rocha on 08/06/25.
//

import Foundation

final class PokemonDetailViewModel: ObservableObject, Sendable {
    
    // MARK: - Published
    @Published var isLoad: Bool = false
    @Published var pokemon: PokemonDetailDTO?
    @Published var mesageError: String = String()
    
    // MARK: - Constructor
    
    init() { }
    
    // MARK: - Method Public
    
    func fetchPokemon(name: String) async {
        do {
            let pokemon = try await NetworkCore.shared.fetchPokemon(name: name)
            if let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemon.id).png") {
                DispatchQueue.main.async {
                    self.pokemon = PokemonDetailDTO(id: "\(pokemon.id)",
                                                    name: "\(pokemon.name)",
                                                    image: url,
                                                    height: pokemon.height,
                                                    isDefault: pokemon.isDefault,
                                                    order: pokemon.order,
                                                    stats: self.convertToStatDetail(stats: pokemon.stats),
                                                    type: self.convertToTypeElementDetail(elementsType: pokemon.types),
                                                    weight: pokemon.weight
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

extension PokemonDetailViewModel {
    // MARK: - Method Private
    
    private func convertToTypeElementDetail(elementsType: [TypeElement]) -> [TypeElementDetail] {
        var typeElementsDetail: [TypeElementDetail] = []
        elementsType.forEach { element in
            typeElementsDetail.append(TypeElementDetail(slot: element.slot,
                                                        type: element.type))
        }
        return typeElementsDetail
    }
    
    private func convertToStatDetail(stats: [Stat]) -> [StatDetail] {
        var statsDetails: [StatDetail] = []
        stats.forEach { stat in
            statsDetails.append(StatDetail(statValue: stat.baseStat,
                                           name: stat.stat.name))
        }
        return statsDetails
    }
}
