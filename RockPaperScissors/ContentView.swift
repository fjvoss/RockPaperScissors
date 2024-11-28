//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Fiona Voss on 11/27/24.
//

import SwiftUI

struct ContentView: View {
    let moves = ["rock", "paper", "scissors"]
    let winningMoves = ["paper", "scissors", "rock"]
    let losingMoves = ["scissors", "rock", "paper"]
    
    @State private var computerMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var questionsRemaining = 3
    
    func desiredMove() -> String {
        if shouldWin {
            return winningMoves[computerMove]
        } else {
            return losingMoves[computerMove]
        }
    }
    
    func nextQuestion() {
        computerMove = Int.random(in: 0...2)
        shouldWin.toggle()
    }
    
    func playMove(_ playerMove: String) {
        if playerMove == desiredMove() {
            score += 1
        } else {
            score -= 1
        }
        
        questionsRemaining -= 1
        
        if questionsRemaining > 0 {
            nextQuestion()
        }
        
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Computer's move: \(moves[computerMove])")
                .font(.title)
            
            Spacer()
            
            Text("You must \(shouldWin ? "win" : "lose")")
                .font(.title)
            
            Spacer()
            
            HStack {
                Button("🪨") {
                    playMove("rock")
                }.font(.system(size: 100))
                
                Spacer()
                
                Button("📄") {
                    playMove("paper")
                }.font(.system(size: 100))
                
                Spacer()
                
                Button("✂️") {
                    playMove("scissors")
                }.font(.system(size: 100))
            }
            
            Spacer()
            
            if questionsRemaining == 0 {
                Text("Game over! Your score: \(score)")
                    .font(.title)
                
            } else {
                Text("Questions remaining: \(questionsRemaining)")
                    .font(.title)
            }
            
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
