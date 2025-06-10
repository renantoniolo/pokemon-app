//
//  SplashScreenView.swift
//  pokemon-app
//
//  Created by Renan Toniolo Rocha on 10/06/25.
//

import SwiftUI
import Lottie

struct SplashScreenView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            PokemonListView()
        } else {
            VStack {
                LottieView(animation: .named("pikachu"))
                    .playing()
                    .looping()
                    .frame(height: 200)
                Image("Pokemon_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .padding(.top, -70)
            }
            .onAppear {
               DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
