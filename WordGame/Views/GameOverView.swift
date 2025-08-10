//
//  GameOverView.swift
//  WordGame
//
//  Created by Aman's Macbook 2023 on 10/08/25.
//

import SwiftUI

struct GameOverView: View {
    @ObservedObject var gameViewModel: TriviaGameViewModel
    @Binding var showGame: Bool
    
    var body: some View {
        VStack(spacing: 32) {
            // Header
            VStack(spacing: 16) {
                Image(systemName: "trophy.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.yellow)
                
                Text("Game Complete!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text("Great job! You've finished the trivia game.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            
            // Score and stats
            VStack(spacing: 24) {
                // Final score
                VStack(spacing: 8) {
                    Text("Final Score")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text("\(gameViewModel.score)")
                        .font(.system(size: 48, weight: .bold, design: .rounded))
                        .foregroundColor(.purple)
                }
                
                // Statistics
                VStack(spacing: 16) {
                    StatRow(title: "Questions Answered", value: "\(gameViewModel.stats.totalQuestions)")
                    StatRow(title: "Correct Answers", value: "\(gameViewModel.stats.correctAnswers)")
                    StatRow(title: "Accuracy", value: String(format: "%.1f%%", gameViewModel.stats.accuracy))
                    StatRow(title: "Best Streak", value: "\(gameViewModel.stats.bestStreak)")
                }
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.gray.opacity(0.1))
                )
            }
            
            Spacer()
            
            // Action buttons
            VStack(spacing: 16) {
                Button(action: {
                    gameViewModel.restartGame()
                }) {
                    Text("Play Again")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.green)
                        )
                }
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        showGame = false
                    }
                }) {
                    Text("Main Menu")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 2)
                        )
                }
            }
        }
        .padding(24)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.yellow.opacity(0.3), Color.white]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
}

// MARK: - Stat Row
struct StatRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.body)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Text(value)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
        }
    }
}

#Preview {
    GameOverView(gameViewModel: TriviaGameViewModel(), showGame: .constant(true))
}
