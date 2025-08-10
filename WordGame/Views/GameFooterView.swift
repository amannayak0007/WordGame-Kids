//
//  GameFooterView.swift
//  WordGame
//
//  Created by Aman's Macbook 2023 on 10/08/25.
//

import SwiftUI

struct GameFooterView: View {
    @ObservedObject var gameViewModel: TriviaGameViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            // Smiley face feedback button
            if gameViewModel.gameState == .answered {
                Button(action: {
                    // TODO: Play positive sound or show additional feedback
                }) {
                    Image(systemName: gameViewModel.isCorrect ? "face.smiling.fill" : "face.dashed")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .background(
                            Circle()
                                .fill(gameViewModel.isCorrect ? Color.green : Color.orange)
                        )
                }
                .transition(.scale.combined(with: .opacity))
            }
            
            // Continue/Finish button
            Button(action: {
                HapticManager.shared.buttonTap()
                if gameViewModel.isLastQuestion {
                    gameViewModel.endGame()
                } else {
                    gameViewModel.continueToNextQuestion()
                }
            }) {
                Text(gameViewModel.continueButtonText)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(buttonColor)
                    )
            }
            .disabled(!gameViewModel.canContinue)
            .opacity(gameViewModel.canContinue ? 1.0 : 0.6)
            .animation(.easeInOut(duration: 0.3), value: gameViewModel.canContinue)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
    
    private var buttonColor: Color {
        if gameViewModel.isLastQuestion {
            return .purple
        } else {
            return .green
        }
    }
}

#Preview {
    GameFooterView(gameViewModel: TriviaGameViewModel())
}
