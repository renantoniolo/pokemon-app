//
//  StatInfo.swift
//  Pokemon
//
//  Created by Renan Toniolo Rocha on 08/06/25.
//

import SwiftUI

struct StatInfo: View {
    let icon: String
    let label: String
    let value: String
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.caption)
                .fontWeight(.semibold)
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}
