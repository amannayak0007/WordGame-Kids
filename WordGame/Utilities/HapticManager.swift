//
//  HapticManager.swift
//  WordGame
//
//  Created by Aman's Macbook 2023 on 10/08/25.
//

import Foundation
import UIKit

class HapticManager {
    static let shared = HapticManager()
    
    private init() {}
    
    // MARK: - Haptic Feedback Methods
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func selection() {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    }
    
    // MARK: - Game-Specific Feedback
    func correctAnswer() {
        notification(type: .success)
    }
    
    func incorrectAnswer() {
        notification(type: .error)
    }
    
    func buttonTap() {
        impact(style: .light)
    }
    
    func questionAnswered() {
        impact(style: .medium)
    }
    
    func gameComplete() {
        notification(type: .success)
    }
}
