//
//  PokemonListView.swift
//  Pokemon
//
//  Created by Renan Toniolo Rocha on 11/05/25.
//

import SwiftUI
import Foundation

struct PokemonListView: View {
    // View Model
    @ObservedObject var viewModel: PokemonListViewModel = PokemonListViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                VStack { // Cabecalio
                    
                    // Title Pokédex
                    PokemonTitle()
                    
                    // Filters
                    HStack {
                        RoundTextField()
                        Spacer(minLength: 16)
                        RoundIconButton()
                    }
                }
                .background(.green)
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 10, trailing: 15))
                if !viewModel.isLoad {
                    Spacer()
                    ProgressView()
                } else {
                    VStack { // Pokemon List
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.fixed(115)),
                                                GridItem(.fixed(115)),
                                                GridItem(.fixed(115))],
                                      spacing: 2) {
                                ForEach(viewModel.pokemonList, id: \.name) { pokemon in
                                    NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                                        PokemonCardView(code: pokemon.id,
                                                       name: pokemon.name,
                                                       imageUrl: URL(string: pokemon.image)!,
                                        )
                                    }
                                }
                            }
                            .background(Color("White"))
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white)
                    )
                }
            }
            .padding()
            .background(Color("Primary"))
            .onAppear() {
                Task {
                 await viewModel.fetchPokemonList()
                }
            }
        }
    }
}

#Preview {
    PokemonListView()
}
