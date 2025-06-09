//
//  StatBar.swift
//  pokemon-app
//
//  Created by Renan Toniolo Rocha on 09/06/25.
//

import SwiftUI

struct StatBar: View {
    let label: String
    let value: Int
    let color: Color
    var body: some View {
        HStack {
            Text(label)
                .frame(width: 110, alignment: .leading)
                .font(.caption)
                .foregroundColor(color)
                .bold()
            Text(String(format: "%03d", value))
                .font(.caption)
                .frame(width: 30, alignment: .leading)
            ProgressView(value: Float(value), total: 100)
                .accentColor(color)
                .frame(height: 8)
        }
    }
}
