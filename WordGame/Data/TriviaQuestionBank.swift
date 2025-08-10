//
//  TriviaQuestionBank.swift
//  WordGame
//
//  Created by Aman's Macbook 2023 on 10/08/25.
//

import Foundation

class TriviaQuestionBank {
    static let shared = TriviaQuestionBank()
    
    private init() {}
    
    private let allQuestions: [TriviaQuestion] = [
        // MARK: - Animals Category
        TriviaQuestion(
            question: "Which animal says 'meow'?",
            answerChoices: [
                AnswerChoice(emoji: "🐱"),
                AnswerChoice(emoji: "🐶"),
                AnswerChoice(emoji: "🐮"),
                AnswerChoice(emoji: "🐷")
            ],
            correctAnswerIndex: 0,
            category: .animals
        ),
        
        TriviaQuestion(
            question: "Which animal has a long neck?",
            answerChoices: [
                AnswerChoice(emoji: "🦒"),
                AnswerChoice(emoji: "🐘"),
                AnswerChoice(emoji: "🦁"),
                AnswerChoice(emoji: "🐯")
            ],
            correctAnswerIndex: 0,
            category: .animals
        ),
        
        TriviaQuestion(
            question: "Which animal lives in the ocean?",
            answerChoices: [
                AnswerChoice(emoji: "🐬"),
                AnswerChoice(emoji: "🦅"),
                AnswerChoice(emoji: "🦊"),
                AnswerChoice(emoji: "🐰")
            ],
            correctAnswerIndex: 0,
            category: .animals
        ),
        
        // MARK: - Colors Category
        TriviaQuestion(
            question: "Which color is the sky?",
            answerChoices: [
                AnswerChoice(emoji: "🔵"),
                AnswerChoice(emoji: "🟡"),
                AnswerChoice(emoji: "🟢"),
                AnswerChoice(emoji: "🔴")
            ],
            correctAnswerIndex: 0,
            category: .colors
        ),
        
        TriviaQuestion(
            question: "Which color is grass?",
            answerChoices: [
                AnswerChoice(emoji: "🟢"),
                AnswerChoice(emoji: "🔵"),
                AnswerChoice(emoji: "🟡"),
                AnswerChoice(emoji: "🟠")
            ],
            correctAnswerIndex: 0,
            category: .colors
        ),
        
        TriviaQuestion(
            question: "Which color is the sun?",
            answerChoices: [
                AnswerChoice(emoji: "🟡"),
                AnswerChoice(emoji: "🔵"),
                AnswerChoice(emoji: "🟢"),
                AnswerChoice(emoji: "🔴")
            ],
            correctAnswerIndex: 0,
            category: .colors
        ),
        
        // MARK: - Numbers Category
        TriviaQuestion(
            question: "How many fingers do you have on one hand?",
            answerChoices: [
                AnswerChoice(emoji: "5️⃣"),
                AnswerChoice(emoji: "3️⃣"),
                AnswerChoice(emoji: "4️⃣"),
                AnswerChoice(emoji: "6️⃣")
            ],
            correctAnswerIndex: 0,
            category: .numbers
        ),
        
        TriviaQuestion(
            question: "Count the dots. How many are there?",
            answerChoices: [
                AnswerChoice(emoji: "🔢"),
                AnswerChoice(emoji: "4️⃣"),
                AnswerChoice(emoji: "3️⃣"),
                AnswerChoice(emoji: "5️⃣")
            ],
            correctAnswerIndex: 1,
            category: .numbers
        ),
        
        TriviaQuestion(
            question: "Which number comes after 2?",
            answerChoices: [
                AnswerChoice(emoji: "3️⃣"),
                AnswerChoice(emoji: "1️⃣"),
                AnswerChoice(emoji: "4️⃣"),
                AnswerChoice(emoji: "5️⃣")
            ],
            correctAnswerIndex: 0,
            category: .numbers
        ),
        
        // MARK: - Shapes Category
        TriviaQuestion(
            question: "Which shape has 3 sides?",
            answerChoices: [
                AnswerChoice(emoji: "🔺"),
                AnswerChoice(emoji: "🔷"),
                AnswerChoice(emoji: "⭕"),
                AnswerChoice(emoji: "🟦")
            ],
            correctAnswerIndex: 0,
            category: .shapes
        ),
        
        TriviaQuestion(
            question: "Which shape is round?",
            answerChoices: [
                AnswerChoice(emoji: "⭕"),
                AnswerChoice(emoji: "🔺"),
                AnswerChoice(emoji: "🟦"),
                AnswerChoice(emoji: "🔷")
            ],
            correctAnswerIndex: 0,
            category: .shapes
        ),
        
        TriviaQuestion(
            question: "Which shape has 4 equal sides?",
            answerChoices: [
                AnswerChoice(emoji: "🟦"),
                AnswerChoice(emoji: "🔺"),
                AnswerChoice(emoji: "⭕"),
                AnswerChoice(emoji: "🔷")
            ],
            correctAnswerIndex: 0,
            category: .shapes
        ),
        
        // MARK: - Food Category
        TriviaQuestion(
            question: "Which fruit is red and round?",
            answerChoices: [
                AnswerChoice(emoji: "🍎"),
                AnswerChoice(emoji: "🍌"),
                AnswerChoice(emoji: "🍊"),
                AnswerChoice(emoji: "🍇")
            ],
            correctAnswerIndex: 0,
            category: .food
        ),
        
        TriviaQuestion(
            question: "Which food is yellow and curved?",
            answerChoices: [
                AnswerChoice(emoji: "🍌"),
                AnswerChoice(emoji: "🍎"),
                AnswerChoice(emoji: "🍊"),
                AnswerChoice(emoji: "🍓")
            ],
            correctAnswerIndex: 0,
            category: .food
        ),
        
        TriviaQuestion(
            question: "Which food is orange and grows on trees?",
            answerChoices: [
                AnswerChoice(emoji: "🍊"),
                AnswerChoice(emoji: "🍎"),
                AnswerChoice(emoji: "🍌"),
                AnswerChoice(emoji: "🍇")
            ],
            correctAnswerIndex: 0,
            category: .food
        ),
        
        // MARK: - Emotions Category
        TriviaQuestion(
            question: "Which face shows happiness?",
            answerChoices: [
                AnswerChoice(emoji: "😊"),
                AnswerChoice(emoji: "😢"),
                AnswerChoice(emoji: "😠"),
                AnswerChoice(emoji: "😴")
            ],
            correctAnswerIndex: 0,
            category: .emotions
        ),
        
        TriviaQuestion(
            question: "Which face shows sadness?",
            answerChoices: [
                AnswerChoice(emoji: "😢"),
                AnswerChoice(emoji: "😊"),
                AnswerChoice(emoji: "😠"),
                AnswerChoice(emoji: "😴")
            ],
            correctAnswerIndex: 0,
            category: .emotions
        ),
        
        TriviaQuestion(
            question: "Which face shows sleepiness?",
            answerChoices: [
                AnswerChoice(emoji: "😴"),
                AnswerChoice(emoji: "😊"),
                AnswerChoice(emoji: "😢"),
                AnswerChoice(emoji: "😠")
            ],
            correctAnswerIndex: 0,
            category: .emotions
        ),
        
        // MARK: - Weather Category
        TriviaQuestion(
            question: "Which weather is sunny?",
            answerChoices: [
                AnswerChoice(emoji: "☀️"),
                AnswerChoice(emoji: "🌧️"),
                AnswerChoice(emoji: "❄️"),
                AnswerChoice(emoji: "⛈️")
            ],
            correctAnswerIndex: 0,
            category: .weather
        ),
        
        TriviaQuestion(
            question: "Which weather is rainy?",
            answerChoices: [
                AnswerChoice(emoji: "🌧️"),
                AnswerChoice(emoji: "☀️"),
                AnswerChoice(emoji: "❄️"),
                AnswerChoice(emoji: "⛈️")
            ],
            correctAnswerIndex: 0,
            category: .weather
        ),
        
        TriviaQuestion(
            question: "Which weather is snowy?",
            answerChoices: [
                AnswerChoice(emoji: "❄️"),
                AnswerChoice(emoji: "☀️"),
                AnswerChoice(emoji: "🌧️"),
                AnswerChoice(emoji: "⛈️")
            ],
            correctAnswerIndex: 0,
            category: .weather
        ),
        
        // MARK: - Transportation Category
        TriviaQuestion(
            question: "Which vehicle flies in the sky?",
            answerChoices: [
                AnswerChoice(emoji: "✈️"),
                AnswerChoice(emoji: "🚗"),
                AnswerChoice(emoji: "🚢"),
                AnswerChoice(emoji: "🚂")
            ],
            correctAnswerIndex: 0,
            category: .transportation
        ),
        
        TriviaQuestion(
            question: "Which vehicle drives on roads?",
            answerChoices: [
                AnswerChoice(emoji: "🚗"),
                AnswerChoice(emoji: "✈️"),
                AnswerChoice(emoji: "🚢"),
                AnswerChoice(emoji: "🚂")
            ],
            correctAnswerIndex: 0,
            category: .transportation
        ),
        
        TriviaQuestion(
            question: "Which vehicle sails on water?",
            answerChoices: [
                AnswerChoice(emoji: "🚢"),
                AnswerChoice(emoji: "✈️"),
                AnswerChoice(emoji: "🚗"),
                AnswerChoice(emoji: "🚂")
            ],
            correctAnswerIndex: 0,
            category: .transportation
        ),
        
        // MARK: - Mixed Category Questions
        TriviaQuestion(
            question: "Find the odd one out",
            answerChoices: [
                AnswerChoice(emoji: "🐱"),
                AnswerChoice(emoji: "🐶"),
                AnswerChoice(emoji: "🍎"),
                AnswerChoice(emoji: "🐰")
            ],
            correctAnswerIndex: 2,
            category: .animals
        ),
        
        TriviaQuestion(
            question: "Which object is not a shape?",
            answerChoices: [
                AnswerChoice(emoji: "🔺"),
                AnswerChoice(emoji: "🍎"),
                AnswerChoice(emoji: "⭕"),
                AnswerChoice(emoji: "🟦")
            ],
            correctAnswerIndex: 1,
            category: .shapes
        ),
        
        TriviaQuestion(
            question: "Count the animals. How many are there?",
            answerChoices: [
                AnswerChoice(emoji: "3️⃣"),
                AnswerChoice(emoji: "4️⃣"),
                AnswerChoice(emoji: "2️⃣"),
                AnswerChoice(emoji: "5️⃣")
            ],
            correctAnswerIndex: 0,
            category: .numbers
        )
    ]
    
    func getQuestions(count: Int) -> [TriviaQuestion] {
        let shuffledQuestions = allQuestions.shuffled()
        return Array(shuffledQuestions.prefix(count))
    }
    
    func getQuestions(for category: QuestionCategory, count: Int) -> [TriviaQuestion] {
        let categoryQuestions = allQuestions.filter { $0.category == category }
        let shuffledQuestions = categoryQuestions.shuffled()
        return Array(shuffledQuestions.prefix(count))
    }
}
