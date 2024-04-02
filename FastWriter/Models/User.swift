//
//  User.swift
//  FastWriter
//
//  Created by Jonas Bondesson on 2024-03-28.
//

import Foundation

class User {
    var name: String
    var highscore: Int
    private var timeLeft: Double
    private var score: Int
    
    

    
    init(name: String, highscore: Int, timeLeft: Double, score: Int) {
        self.name = name
        self.highscore = highscore
        self.timeLeft = timeLeft
        self.score = score
    }
    
    func setScore(score: Int) {
        self.score += score
    }
    
    var getScore: Int {return self.score}
    
    
}

func timeLeft(timer: Timer?) {
    
}
