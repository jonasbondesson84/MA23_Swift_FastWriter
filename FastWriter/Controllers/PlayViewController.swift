//
//  PlayViewController.swift
//  FastWriter
//
//  Created by Jonas Bondesson on 2024-03-28.
//

import UIKit

class PlayViewController: UIViewController, UITextFieldDelegate  {
    
    var user = User(name: "Jonas", highscore: 0, timeLeft: 30.0, score: 0)
    let TIME_FOR_WORD = 5
    let TIME_FOR_GAME = 10
    var word = Word()
    var gameTime = 0.0
    var wordTime = 0.0
    var timerGame: Timer?
    var timerWord: Timer?
    let formatter = DateComponentsFormatter()
    var activeGame = true
    var segueEndGameID = ""

    @IBOutlet weak var timeLeft: UILabel!
    @IBOutlet weak var answerWord: UITextField!
    
    @IBOutlet weak var currentWord: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var gameTimeLeft: UILabel!
    
    @IBOutlet weak var gameScore: UILabel!
    @IBOutlet weak var stackViewGame: UIStackView!
    @IBOutlet weak var stackViewPlayAgain: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerWord.delegate = self
        answerWord.becomeFirstResponder()
        resetGame()
        
        timerWord = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: wordTimer(timer:))
        timerGame = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: changeGameTimer(timer:))
        
    }
    
    @IBAction func btnPlayAgain(_ sender: UIButton) {
        resetGame()
    }
    
    @IBAction func btnMainMenu(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func changeGameTimer(timer: Timer?) {
        if gameTime > 0.1 {
            gameTime -= 0.1
            let timeString = String(format: "%.1f", gameTime)
            gameTimeLeft.text = "Game Time: \(timeString)"
        } else {
            stopGame()
        }
        
    }
    
    func resetGame() {
        gameTime = TimeInterval(TIME_FOR_GAME)
        wordTime = TimeInterval(TIME_FOR_WORD)
        stackViewPlayAgain.isHidden = true
        randomWord()
        user.resetScore()
        score.text = "Score: 0"
        activeGame = true
        stackViewGame.isHidden = false
        stackViewPlayAgain.isHidden = true
    }
    
        
    func wordTimer(timer: Timer?) {
        if activeGame {
            if wordTime >= 0 {
                wordTime -= 0.5
                let time = Int(ceil(wordTime))
                timeLeft.text = "Time: \(time)"
                if word.compareWords(currentWord: currentWord.text, answerWord: answerWord.text , user: user) {
                    score.text = "Score: \(user.getScore)"
                    answerWord.text = ""
                    //                timer?.invalidate()
                    randomWord()
                }
            } else {
                //            timer?.invalidate()
                if user.getScore > 0 {
                    user.setScore(score: -10)
                    score.text = "Score: \(user.getScore)"
                    answerWord.text = ""
                    
                }
                randomWord()
            }
        }
        
        
    }
    
    
    
    func randomWord() {
        if let randomWord = word.getRandomWord() {
            wordTime = TimeInterval(TIME_FOR_WORD)
            let time = Int(wordTime)
            timeLeft.text = "Time: \(time)"
            currentWord.text = randomWord.word
    
        } else {
            currentWord.text = "Oops! Inga fler ord!"
        }
    }
    
    func stopGame() {
        activeGame = false
        view.endEditing(true)
        stackViewGame.isHidden = true
        stackViewPlayAgain.isHidden = false
        gameScore.text = "Your score was \(user.getScore)"
        //Lägga till vad som ska hända när spelet tar slut här.
        
    }
    
    
    deinit {
        timerGame?.invalidate()
        timerWord?.invalidate()
    }
    
   // override func viewDidAppear(_ animated: Bool) {
     //   super.viewDidAppear(animated)
     //   answerWord.becomeFirstResponder()
   // }
        
        
        
    
        


    
  
    
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
