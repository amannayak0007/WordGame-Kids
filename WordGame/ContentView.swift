//
//  ContentView.swift
//  WordGame
//
//  Created by Aman's Macbook 2023 on 10/08/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var gameViewModel = TriviaGameViewModel()
    @State private var showGame = false
    
    var body: some View {
        ZStack {
            if !showGame {
                WelcomeView(showGame: $showGame)
            } else {
                ZStack {
                    // Background gradient
                    LinearGradient(
                        gradient: Gradient(colors: [Color.yellow.opacity(0.3), Color.white]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()
                    
                    if gameViewModel.gameState == .gameOver {
                        GameOverView(gameViewModel: gameViewModel, showGame: $showGame)
                    } else {
                        VStack(spacing: 0) {
                            // Header with progress
                            GameHeaderView(
                                progress: gameViewModel.progress,
                                score: gameViewModel.score
                            )
                            
                            // Main game content
                            GameContentView(gameViewModel: gameViewModel)
                            
                            Spacer()
                            
                            // Bottom navigation
                            GameFooterView(gameViewModel: gameViewModel)
                        }
                    }
                }
                .onAppear {
                    gameViewModel.startGame()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
