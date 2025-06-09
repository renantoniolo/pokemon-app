//
//  PokemonDetailView.swift
//  Pokemon
//
//  Created by Renan Toniolo Rocha on 25/05/25.
//

import SwiftUI
import Lottie
import Foundation

struct PokemonDetailView: View {
    
    let pokemon: PokemonDTO
    @ObservedObject var viewModel: PokemonDetailViewModel = PokemonDetailViewModel()

    private func convertColor(typeElement: [TypeElementDetail]?) -> Color {
        guard let specie = typeElement?.first?.type else {
            return .black
        }
        return Color(specie.name.capitalized)
    }
    
    var body: some View {
        NavigationStack {
            if !viewModel.isLoad {
                VStack{
                    LottieView(animation: .named("pokedex"))
                        .playing()
                        .looping()
                        .frame(height: 100)
                    Text("Loading...")
                        .padding(.all, 5)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
            }
            else {
                ScrollView {
                    VStack(spacing: 20) {
                        ZStack(alignment: .top) {
                            // Header
                            PokemonHeaderDetail(code: pokemon.id,
                                                name: pokemon.name)
                            
                            // Pokemon Background
                            HStack {
                                Spacer()
                                Image("Pokeball_background")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 210)
                            }
                            .padding(-10)
                        }
                        
                        ZStack(alignment: .top) {
                            
                            // Pokemon Card
                            VStack(spacing: 16) {
                                
                                // Tags
                                HStack(spacing: 12) {
                                    ForEach(viewModel.pokemon?.type ?? [], id: \.type.name) { TypeElementDetail in
                                        TypeTag(text: TypeElementDetail.type.name,
                                                color: Color("\(TypeElementDetail.type.name.capitalized)"))
                                    }
                                }
                                .padding(.top, 50)
                                
                                // About
                                Text("About")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(convertColor(typeElement: viewModel.pokemon?.type))
                                
                                HStack(spacing: 40) {
                                    StatInfo(icon: "scalemass", label: "Weight", value: "\(viewModel.pokemon?.weight ?? 0) kg")
                                    StatInfo(icon: "ruler", label: "Height", value: "\(viewModel.pokemon?.height ?? 0) m")
                                    VStack {
                                        Text("Chlorophyll")
                                        Text("Overgrow")
                                    }
                                    .font(.caption)
                                }
                                
                                // Descripton
                                Text("Hello, I am \(pokemon.name) Pokémon. I am known for my unique abilities and characteristics that make me special in the Pokémon world.")
                                    .font(.caption)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                
                                // Base Stats
                                Text("Base Stats")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(convertColor(typeElement: viewModel.pokemon?.type))
                                
                                ForEach(viewModel.pokemon?.stats ?? [], id: \.id) { statDetail in
                                    StatBar(label: statDetail.name.uppercased(),
                                            value: statDetail.statValue,
                                            color: convertColor(typeElement: viewModel.pokemon?.type))
                                }
                                
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(16)
                            .shadow(radius: 3)
                            
                            // Pokemon Image
                            AsyncImage(url: viewModel.pokemon?.image) { stateImage in
                                if let image = stateImage.image {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 310)
                                        .padding(.top, -200)
                                } else if stateImage.error != nil {
                                    Image(systemName: "exclamationmark.triangle")
                                        .foregroundColor(.red)
                                        .frame(height: 310)
                                        .padding(.top, -200)
                                } else {
                                    ProgressView()
                                        .frame(height: 310)
                                        .padding(.top, -200)
                                }
                            }
                            
                        }
                    }
                    .padding()
                }
                .background(convertColor(typeElement: viewModel.pokemon?.type))
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear() {
            Task {
              await viewModel.fetchPokemon(name: pokemon.name)
            }
        }
    }
}

//#Preview {
//    PokemonDetailView(pokemon: PokemonDTO(id: "002", name: "Pickachu", image: ""))
//}
