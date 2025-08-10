//
//  WelcomeView.swift
//  WordGame
//
//  Created by Aman's Macbook 2023 on 10/08/25.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var showGame: Bool
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                gradient: Gradient(colors: [Color.yellow.opacity(0.4), Color.orange.opacity(0.2), Color.white]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Spacer()
                
                // App icon and title
                VStack(spacing: 20) {
                    ZStack {
                        Circle()
                            .fill(Color.purple.opacity(0.2))
                            .frame(width: 120, height: 120)
                        
                        Text("🎯")
                            .font(.system(size: 60))
                    }
                    
                    Text("Kids Trivia")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)
                    
                    Text("Fun Learning with Emojis!")
                        .font(.title3)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                
                // Features
                VStack(spacing: 16) {
                    FeatureRow(emoji: "🐾", text: "Learn about animals")
                    FeatureRow(emoji: "🎨", text: "Discover colors")
                    FeatureRow(emoji: "🔢", text: "Practice numbers")
                    FeatureRow(emoji: "🍎", text: "Explore food")
                    FeatureRow(emoji: "😊", text: "Understand emotions")
                }
                .padding(.horizontal, 40)
                
                Spacer()
                
                // Start button
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        showGame = true
                    }
                }) {
                    HStack(spacing: 12) {
                        Text("🎮")
                            .font(.title2)
                        
                        Text("Start Game")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.purple, Color.blue]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                    )
                    .shadow(color: .purple.opacity(0.3), radius: 10, x: 0, y: 5)
                }
                .padding(.horizontal, 40)
                
                // Footer
                Text("Perfect for ages 3-8")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 20)
            }
        }
    }
}

// MARK: - Feature Row
struct FeatureRow: View {
    let emoji: String
    let text: String
    
    var body: some View {
        HStack(spacing: 16) {
            Text(emoji)
                .font(.title2)
            
            Text(text)
                .font(.body)
                .foregroundColor(.primary)
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.8))
        )
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

#Preview {
    WelcomeView(showGame: .constant(false))
}
