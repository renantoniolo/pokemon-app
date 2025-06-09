//
//  TypeTag.swift
//  Pokemon
//
//  Created by Renan Toniolo Rocha on 08/06/25.
//

import SwiftUI

struct TypeTag: View {
    let text: String
    let color: Color
    var body: some View {
        Text(text)
            .font(.caption)
            .fontWeight(.bold)
            .padding(.vertical, 6)
            .padding(.horizontal, 12)
            .background(color.opacity(0.8))
            .foregroundColor(.white)
            .cornerRadius(20)
    }
}
