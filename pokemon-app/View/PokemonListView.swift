//
//  PokemonListView.swift
//  Pokemon
//
//  Created by Renan Toniolo Rocha on 11/05/25.
//

import SwiftUI
import Foundation
import Lottie

struct PokemonListView: View {

    @ObservedObject var viewModel: PokemonListViewModel = PokemonListViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                VStack { // Cabecalio
                    
                    // Title Pokédex
                    PokemonTitle()
                    
                    // Filters
                    HStack {
                        RoundTextField(text: $viewModel.searchText)
                        Spacer(minLength: 16)
                        RoundIconButton(orderBy: viewModel.pokemonOrderByName)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 10, trailing: 15))
                if !viewModel.isLoad {
                    Spacer()
                    LottieView(animation: .named("pokedex"))
                        .playing()
                        .looping()
                        .frame(height: 60)
                    Spacer()
                } else {
                    VStack { // Pokemon List
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.fixed(115)),
                                                GridItem(.fixed(115)),
                                                GridItem(.fixed(115))],
                                      spacing: 2) {
                                ForEach(viewModel.pokemonList, id: \.name) { pokemon in
                                    NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                                        PokemonCardView(code: pokemon.code,
                                                        name: pokemon.name,
                                                        imageUrl: URL(string: pokemon.image)!
                                        )
                                    }
                                }
                            }
                            .background(Color("White"))
                        }
                    }
                    .padding(.all,10)
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
            .ignoresSafeArea(.keyboard)
        }
    }
}

//#Preview {
//    PokemonListView()
//}
