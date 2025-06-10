//
//  PokemonStrings.swift
//  pokemon-app
//
//  Created by Renan Toniolo Rocha on 10/06/25.
//

import Foundation

enum PokemonStrings: String {
    case search = "Search"
    case text_description = "Text Description"
    case base_stats = "Base Stats"
    case about = "About"
    case chlorophyll = "Chlorophyll"
    case overgrow = "Overgrow"
    case weight = "Weight"
    case height = "Height"
    
    func localized() -> String {
        return NSLocalizedString(
            self.rawValue,
            bundle: Bundle.main,
            comment: String())
    }
}
