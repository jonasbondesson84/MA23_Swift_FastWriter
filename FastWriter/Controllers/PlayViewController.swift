//
//  PlayViewController.swift
//  FastWriter
//
//  Created by Jonas Bondesson on 2024-03-28.
//

import UIKit

class PlayViewController: UIViewController, UITextFieldDelegate  {
    
    var user = User(name: "Jonas", highscore: 0, timeLeft: 30.0, score: 0)
    
    var word = Word()
    var time = TimeInterval(5)
    var timer: Timer?
    let formatter = DateComponentsFormatter()
    var activeGame = true

    @IBOutlet weak var timeLeft: UILabel!
    @IBOutlet weak var answerWord: UITextField!
    @IBOutlet weak var currentWord: UILabel!
    @IBOutlet weak var score: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerWord.delegate = self
        answerWord.becomeFirstResponder()
        
        randomWord()
    
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: changeTime(timer:))
        
    }
    
    func changeTime(timer: Timer?) {
        if time > 0.1 {
            time -= 0.1
            let timeString = String(format: "%.1f", time)
            timeLeft.text = "Time: \(timeString)"
        } else {
            stopGame()
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(activeGame) {
            if textField.text == currentWord.text {
                user.setScore(score: 10)
                score.text = "Score: \(user.getScore)"
                randomWord()
                textField.text = ""
            }
        }
            return true
            
        
    }
    
    func randomWord() {
        if let randomWord = word.getRandomWord() {
            currentWord.text = randomWord.word
    
        } else {
            currentWord.text = "Oops! Inga fler ord!"
        }
    }
    
    func stopGame() {
        activeGame = false
        
    }
    
    
    deinit {
        timer?.invalidate()
    }
    
   // override func viewDidAppear(_ animated: Bool) {
     //   super.viewDidAppear(animated)
     //   answerWord.becomeFirstResponder()
   // }
        
        
        
    
        


    
  
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
