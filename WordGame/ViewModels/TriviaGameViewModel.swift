//
//  TriviaGameViewModel.swift
//  WordGame
//
//  Created by Aman's Macbook 2023 on 10/08/25.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class TriviaGameViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var currentQuestion: TriviaQuestion?
    @Published var selectedAnswerIndex: Int?
    @Published var gameState: GameState = .playing
    @Published var score: Int = 0
    @Published var progress: Double = 0.0
    @Published var stats = GameStats()
    @Published var showFeedback: Bool = false
    @Published var isCorrect: Bool = false
    @Published var questionsAnswered: Int = 0
    
    // MARK: - Private Properties
    private var questions: [TriviaQuestion] = []
    private var currentQuestionIndex: Int = 0
    private var timer: Timer?
    private var startTime: Date?
    
    // MARK: - Constants
    private let totalQuestions = 10
    private let pointsPerCorrectAnswer = 10
    private let streakBonus = 5
    
    // MARK: - Initialization
    init() {
        // Questions will be loaded when game starts
    }
    
    // MARK: - Game Management
    func startGame() {
        questions = TriviaQuestionBank.shared.getQuestions(count: totalQuestions)
        currentQuestionIndex = 0
        score = 0
        progress = 0.0
        questionsAnswered = 0
        stats = GameStats()
        gameState = .playing
        loadNextQuestion()
    }
    
    func loadNextQuestion() {
        guard currentQuestionIndex < questions.count else {
            endGame()
            return
        }
        
        currentQuestion = questions[currentQuestionIndex]
        selectedAnswerIndex = nil
        gameState = .playing
        showFeedback = false
        startTime = Date()
    }
    
    func selectAnswer(_ index: Int) {
        guard gameState == .playing else { return }
        
        selectedAnswerIndex = index
        gameState = .answered
        
        // Calculate time spent
        if let startTime = startTime {
            stats.timeSpent += Date().timeIntervalSince(startTime)
        }
        
        // Check if answer is correct
        let isAnswerCorrect = index == currentQuestion?.correctAnswerIndex
        isCorrect = isAnswerCorrect
        
        if isAnswerCorrect {
            handleCorrectAnswer()
            HapticManager.shared.correctAnswer()
        } else {
            handleIncorrectAnswer()
            HapticManager.shared.incorrectAnswer()
        }
        
        stats.totalQuestions += 1
        questionsAnswered += 1
        
        // Show feedback
        showFeedback = true
        
        // Update progress
        progress = Double(questionsAnswered) / Double(totalQuestions)
    }
    
    private func handleCorrectAnswer() {
        stats.correctAnswers += 1
        stats.currentStreak += 1
        
        if stats.currentStreak > stats.bestStreak {
            stats.bestStreak = stats.currentStreak
        }
        
        // Calculate score with streak bonus
        let streakBonus = min(stats.currentStreak - 1, 5) * self.streakBonus
        score += pointsPerCorrectAnswer + streakBonus
    }
    
    private func handleIncorrectAnswer() {
        stats.currentStreak = 0
    }
    
    func continueToNextQuestion() {
        currentQuestionIndex += 1
        loadNextQuestion()
    }
    
    func endGame() {
        gameState = .gameOver
        timer?.invalidate()
        timer = nil
        HapticManager.shared.gameComplete()
    }
    
    func restartGame() {
        startGame()
    }
    
    // MARK: - Helper Methods
    var isLastQuestion: Bool {
        currentQuestionIndex >= questions.count - 1
    }
    
    var canContinue: Bool {
        selectedAnswerIndex != nil && gameState == .answered
    }
    
    var continueButtonText: String {
        isLastQuestion ? "FINISH" : "CONTINUE"
    }
    
    var feedbackMessage: String {
        if isCorrect {
            return "Great job! 🎉"
        } else {
            let correctAnswer = currentQuestion?.answerChoices[currentQuestion?.correctAnswerIndex ?? 0].emoji ?? ""
            return "Try again! The answer was \(correctAnswer)"
        }
    }
}
