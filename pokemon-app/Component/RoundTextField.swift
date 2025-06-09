//
//  RoundTextField.swift
//  Pokemon
//
//  Created by Renan Toniolo Rocha on 24/05/25.
//

import SwiftUI

struct RoundTextField: View {
    @State private var text = String()
    var body: some View {
        TextField("Search",
                  text: $text)
        .frame(height: 32)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .cornerRadius(16)
        .shadow(radius: 1)
    }
}

struct RoundTextField_Previews: PreviewProvider {
    static var previews: some View {
        RoundTextField()
    }
}
