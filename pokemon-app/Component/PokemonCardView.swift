//
//  PokemonCardView.swift
//  Pokemon
//
//  Created by Renan Toniolo Rocha on 11/05/25.
//

import SwiftUI
import Lottie

struct PokemonCardView: View {
    let code: String
    let name: String
    let imageUrl: URL

    var body: some View {
        ZStack {
            VStack{
                VStack {
                }
                .frame(width: 114, height: 61)
                VStack {
                }
                .padding()
                .frame(width: 114, height: 48)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color("Background"))
                )
                .padding()
            }
            
            // Card Description
            VStack(spacing: 2) {
                // Code Number
                HStack(spacing: 10) {
                    Spacer()
                    Text(code)
                        .font(.smallCaps(Font.system(size: 10))())
                        .foregroundColor(Color("Medium"))
                        .multilineTextAlignment(.trailing)
                }
                
                Spacer(minLength: 72)
                
                // Pokemon Name
                Text(name.capitalized)
                    .font(.caption2)
                    .foregroundColor(Color("Dark"))
                    .multilineTextAlignment(.center)
            }
            .padding()
            .frame(width: 104, height: 108)
            
            // Pokemon Image
            AsyncImage(url: imageUrl) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 90)
                } else if phase.error != nil {
                    Image(systemName: "exclamationmark.triangle")
                        .foregroundColor(.red)
                        .frame(height: 90)
                } else {
                    LottieView(animation: .named("pokedex"))
                        .playing()
                        .looping()
                        .frame(height: 20)
                }
            }
        }
        .padding()
        .frame(width: 114, height: 118)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(radius: 2)
        )
        .padding(4)
        
    }
}

struct PokemonRowView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCardView(code: "#022", name: "Pidey", imageUrl: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/22.png")!)
    }
}
