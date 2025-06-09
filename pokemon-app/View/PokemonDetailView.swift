//
//  PokemonDetailView.swift
//  Pokemon
//
//  Created by Renan Toniolo Rocha on 25/05/25.
//

import SwiftUI
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
                Text("Carregando...")
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
                                    .font(.title2)
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
                                Text("Hello, I am \(pokemon.name) Pokémon and am type fire..")
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                
                                // Base Stats
                                Text("Base Stats")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(convertColor(typeElement: viewModel.pokemon?.type))
                                
//                                ForEach(viewModel.pokemon?.stats ?? [], id: \.baseStat) { statDetail in
//                                    
//                                    //print("\(statDetail.stat.name)")
//                                    StatBar(label: "HR",
//                                            value: 45,
//                                            color: convertColor(typeElement: viewModel.pokemon?.type))
//                                }
                                
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


struct StatBar: View {
    let label: String
    let value: Int
    let color: Color
    var body: some View {
        HStack {
            Text(label)
                .frame(width: 40, alignment: .leading)
                .foregroundColor(color)
                .bold()
            Text(String(format: "%03d", value))
                .frame(width: 40, alignment: .leading)
            ProgressView(value: Float(value), total: 100)
                .accentColor(color)
                .frame(height: 8)
        }
    }
}
