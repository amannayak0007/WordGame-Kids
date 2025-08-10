//
//  GameHeaderView.swift
//  WordGame
//
//  Created by Aman's Macbook 2023 on 10/08/25.
//

import SwiftUI

struct GameHeaderView: View {
    let progress: Double
    let score: Int
    
    var body: some View {
        VStack(spacing: 0) {
            // Game header
            HStack(spacing: 16) {
                // Settings button
                Button(action: {
                    // TODO: Show settings
                }) {
                    Image(systemName: "gearshape.fill")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                
                // Progress bar
                ProgressView(value: progress)
                    .progressViewStyle(LinearProgressViewStyle(tint: .purple))
                    .scaleEffect(y: 2)
                
                // Score and trophy
                VStack(spacing: 4) {
                    HStack(spacing: 4) {
                        Image(systemName: "trophy.fill")
                            .font(.caption)
                            .foregroundColor(.yellow)
                        Text("\(score)")
                            .font(.caption)
                            .fontWeight(.semibold)
                    }
                    
                    // Audio button
                    Button(action: {
                        // TODO: Play audio
                    }) {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color.white)
            .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
        }
    }
}

#Preview {
    GameHeaderView(progress: 0.3, score: 25)
}
