//
//  GameContentView.swift
//  WordGame
//
//  Created by Aman's Macbook 2023 on 10/08/25.
//

import SwiftUI

struct GameContentView: View {
    @ObservedObject var gameViewModel: TriviaGameViewModel
    
    var body: some View {
        VStack(spacing: 24) {
            // Question area
            QuestionView(question: gameViewModel.currentQuestion?.question ?? "")
            
            // Answer choices grid
            AnswerChoicesGridView(
                answerChoices: gameViewModel.currentQuestion?.answerChoices ?? [],
                selectedIndex: gameViewModel.selectedAnswerIndex,
                gameState: gameViewModel.gameState,
                correctAnswerIndex: gameViewModel.currentQuestion?.correctAnswerIndex ?? 0,
                onAnswerSelected: { index in
                    gameViewModel.selectAnswer(index)
                }
            )
            
            // Feedback area
            if gameViewModel.showFeedback {
                FeedbackView(
                    isCorrect: gameViewModel.isCorrect,
                    message: gameViewModel.feedbackMessage
                )
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .animation(.easeInOut(duration: 0.5), value: gameViewModel.showFeedback)
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
    }
}

// MARK: - Question View
struct QuestionView: View {
    let question: String
    
    var body: some View {
        VStack(spacing: 12) {
            Text(question)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            // Audio button for question
            Button(action: {
                // TODO: Play question audio
            }) {
                Image(systemName: "speaker.wave.2.fill")
                    .font(.title3)
                    .foregroundColor(.blue)
                    .padding(12)
                    .background(Color.blue.opacity(0.1))
                    .clipShape(Circle())
            }
        }
    }
}

// MARK: - Answer Choices Grid View
struct AnswerChoicesGridView: View {
    let answerChoices: [AnswerChoice]
    let selectedIndex: Int?
    let gameState: GameState
    let correctAnswerIndex: Int
    let onAnswerSelected: (Int) -> Void
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 2), spacing: 16) {
            ForEach(Array(answerChoices.enumerated()), id: \.offset) { index, choice in
                AnswerChoiceButton(
                    emoji: choice.emoji,
                    text: choice.text,
                    isSelected: selectedIndex == index,
                    isCorrect: gameState == .answered && index == correctAnswerIndex,
                    isIncorrect: gameState == .answered && selectedIndex == index && index != correctAnswerIndex,
                    isDisabled: gameState == .answered
                ) {
                    HapticManager.shared.buttonTap()
                    onAnswerSelected(index)
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

// MARK: - Answer Choice Button
struct AnswerChoiceButton: View {
    let emoji: String
    let text: String
    let isSelected: Bool
    let isCorrect: Bool
    let isIncorrect: Bool
    let isDisabled: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Text(emoji)
                    .font(.system(size: 48))
                
                if !text.isEmpty {
                    Text(text)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 120)
            .background(backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(borderColor, lineWidth: 3)
            )
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .scaleEffect(isSelected ? 1.05 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: isSelected)
        }
        .disabled(isDisabled)
    }
    
    private var backgroundColor: Color {
        if isCorrect {
            return .green.opacity(0.2)
        } else if isIncorrect {
            return .red.opacity(0.2)
        } else if isSelected {
            return .blue.opacity(0.2)
        } else {
            return .white
        }
    }
    
    private var borderColor: Color {
        if isCorrect {
            return .green
        } else if isIncorrect {
            return .red
        } else if isSelected {
            return .blue
        } else {
            return .gray.opacity(0.3)
        }
    }
}

// MARK: - Feedback View
struct FeedbackView: View {
    let isCorrect: Bool
    let message: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                .font(.title2)
                .foregroundColor(isCorrect ? .green : .red)
            
            Text(message)
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(.primary)
            
            Spacer()
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(isCorrect ? Color.green.opacity(0.1) : Color.red.opacity(0.1))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(isCorrect ? Color.green.opacity(0.3) : Color.red.opacity(0.3), lineWidth: 1)
        )
        .transition(.move(edge: .bottom).combined(with: .opacity))
    }
}

#Preview {
    GameContentView(gameViewModel: TriviaGameViewModel())
}
