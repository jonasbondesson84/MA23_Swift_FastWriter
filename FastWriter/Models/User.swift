//
//  User.swift
//  FastWriter
//
//  Created by Jonas Bondesson on 2024-03-28.
//

import Foundation

class User: Codable {
    var name: String
    var highscore: Int
//    private var timeLeft: Double
    private var score: Int
    
    

    
    init(name: String, highscore: Int, score: Int) {
        self.name = name
       self.highscore = highscore
//        self.timeLeft = timeLeft
        self.score = score
    }
    
    func setScore(timeLeft: Double?) {
        if let time = timeLeft {
            let score = Int(time*10)
            self.score += score
        } else {
            self.score -= 10
            if self.score < 0 {
                self.score = 0
            }
        }
    }
    
    var getScore: Int {return self.score}
    
    func resetScore() {
        self.score = 0
    }
    
    
}

func timeLeft(timer: Timer?) {
    
}
