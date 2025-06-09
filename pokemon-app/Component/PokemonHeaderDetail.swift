//
//  PokemonHeaderDetail.swift
//  Pokemon
//
//  Created by Renan Toniolo Rocha on 02/06/25.
//

import SwiftUI

struct PokemonHeaderDetail: View {
    @Environment(\.dismiss) var dismiss
    let code: String
    let name: String
    
    var body: some View {
        HStack{
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .padding()
            }
            .frame(width: 32, height: 32)
            Text(name.capitalized)
            .foregroundColor(Color("White"))
            .padding()
            .font(.title)
            .bold()
            Spacer()
            Text(code)
            .foregroundColor(Color("White"))
            .padding()
            .font(.headline)
            .bold()
        }
        .padding(.horizontal)
    }
}
