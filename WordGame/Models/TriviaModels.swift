//
//  TriviaModels.swift
//  WordGame
//
//  Created by Aman's Macbook 2023 on 10/08/25.
//

import Foundation

// MARK: - Core Models
struct TriviaQuestion {
    let id: UUID
    let question: String
    let answerChoices: [AnswerChoice]
    let correctAnswerIndex: Int
    let category: QuestionCategory
    let difficulty: Difficulty
    
    init(question: String, answerChoices: [AnswerChoice], correctAnswerIndex: Int, category: QuestionCategory, difficulty: Difficulty = .easy) {
        self.id = UUID()
        self.question = question
        self.answerChoices = answerChoices
        self.correctAnswerIndex = correctAnswerIndex
        self.category = category
        self.difficulty = difficulty
    }
}

struct AnswerChoice {
    let emoji: String
    let text: String
    
    init(emoji: String, text: String = "") {
        self.emoji = emoji
        self.text = text
    }
}

// MARK: - Enums
enum QuestionCategory: String, CaseIterable {
    case animals = "Animals"
    case colors = "Colors"
    case numbers = "Numbers"
    case shapes = "Shapes"
    case food = "Food"
    case emotions = "Emotions"
    case weather = "Weather"
    case transportation = "Transportation"
    
    var emoji: String {
        switch self {
        case .animals: return "🐾"
        case .colors: return "🎨"
        case .numbers: return "🔢"
        case .shapes: return "📐"
        case .food: return "🍎"
        case .emotions: return "😊"
        case .weather: return "☀️"
        case .transportation: return "🚗"
        }
    }
}

enum Difficulty: String, CaseIterable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    
    var color: String {
        switch self {
        case .easy: return "green"
        case .medium: return "orange"
        case .hard: return "red"
        }
    }
}

enum GameState {
    case playing
    case answered
    case gameOver
    case paused
}

// MARK: - Game Statistics
struct GameStats {
    var totalQuestions: Int = 0
    var correctAnswers: Int = 0
    var currentStreak: Int = 0
    var bestStreak: Int = 0
    var timeSpent: TimeInterval = 0
    
    var accuracy: Double {
        guard totalQuestions > 0 else { return 0 }
        return Double(correctAnswers) / Double(totalQuestions) * 100
    }
}
