//
//  PlayViewController.swift
//  FastWriter
//
//  Created by Jonas Bondesson on 2024-03-28.
//

import UIKit

class PlayViewController: UIViewController, UITextFieldDelegate  {
    
    var user = User(name: "Jonas", highscore: 0, score: 0)
    var highScore = [User]()
    let TIME_FOR_WORD = 5.0
    let TIME_FOR_GAME = 30

    var word = Word()
    var gameTime = 0.0
    var wordTime = 0.0
    var timerGame: Timer?
    var timerWord: Timer?
    let formatter = DateComponentsFormatter()
    var activeGame = true
    var segueEndGameID = ""
    var selectedMode: String?
    @IBOutlet weak var timeLeft: UILabel!
    @IBOutlet weak var answerWord: UITextField!
    
    @IBOutlet weak var currentWord: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var gameTimeLeft: UILabel!
    
    @IBOutlet weak var scoreBar: UIProgressView!
    @IBOutlet weak var gameScore: UILabel!
    @IBOutlet weak var stackViewGame: UIStackView!
    @IBOutlet weak var stackViewPlayAgain: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerWord.delegate = self
        answerWord.becomeFirstResponder()
        loadHighscore()
        resetGame()
        
        
    }
    
    @IBAction func btnPlayAgain(_ sender: UIButton) {
        resetGame()
    }
    
    @IBAction func btnMainMenu(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func changeGameTimer(timer: Timer?) {
        if gameTime > 0 {
            gameTime -= 1
            let timeString = String(Int(gameTime))
            gameTimeLeft.text = "Time left: \(timeString)"
            if gameTime <= 0 {
                stopGame()
            }
            
        }
    }
    
    func resetGame() {
        timerWord = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: wordTimer(timer:))
        timerGame = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: changeGameTimer(timer:))
        gameTime = TimeInterval(TIME_FOR_GAME)
        wordTime = TimeInterval(TIME_FOR_WORD)
        stackViewPlayAgain.isHidden = true
        randomWord()
        user.resetScore()
        gameTimeLeft.text = "Time left: \(Int(gameTime))"
        score.text = "Your score: 0"
        activeGame = true
        stackViewGame.isHidden = false
        stackViewPlayAgain.isHidden = true
    }
    
        
    func wordTimer(timer: Timer?) {
        if activeGame {
            if wordTime >= 0 {
                updateProgessBar()
                wordTime -= 0.1
                let time = Int((wordTime )*10)
                timeLeft.text = "Score: \(time)"
                
                if word.compareWords(currentWord: currentWord.text, answerWord: answerWord.text) {
                    
//                    UIView.animate(withDuration: 0.5, animations: {self.timeLeft.alpha = 1.0}, completion: {
//                        _ in UIView.animate(withDuration: 0.5, animations: {self.timeLeft.alpha = 0.0})
//                    })
                    user.setScore(timeLeft: wordTime)
                    score.text = "Your score: \(user.getScore)"
                    answerWord.text = ""
                    randomWord()
                }
            } else {
                if user.getScore > 0 {
                    user.setScore(timeLeft: nil)
                    timeLeft.text = "Score: -10"
                    score.text = "Your score: \(user.getScore)"
                    answerWord.text = ""
                }
                randomWord()
            }
        }
        
        
    }
    
    
    func randomWord() {
        guard let selectedMode = selectedMode?.lowercased() else {
            print("Selected mode is nil")
            return
        }
        
        var difficultyForSelectedMode: Int {
            switch selectedMode {
            case "easy":
                return 1
            case "medium":
                return 2
            case "hard":
                return 3
            default:
           
                return 1
            }
        }
        
        print(selectedMode)
        let filteredWords = word.words.filter { $0.difficulty == difficultyForSelectedMode }
    
        if let randomWord = filteredWords.randomElement() {
            wordTime = TimeInterval(TIME_FOR_WORD)
            let time = Int(wordTime)
            currentWord.text = randomWord.word.capitalized
        } else {
            currentWord.text = "Oops! Inga fler ord!"
        }
    }
    
    func stopGame() {
        print("stopGame anropas")
        activeGame = false
        addHighscore(name: user.name, highscore: user.getScore)
        timerGame?.invalidate()
        timerWord?.invalidate()
        view.endEditing(true)
        stackViewGame.isHidden = true
        stackViewPlayAgain.isHidden = false
        gameScore.text = "Your score was \(user.getScore)"
        //Lägga till vad som ska hända när spelet tar slut här.
        
    }
    
    func updateProgessBar() {
        scoreBar.progress -= 0.02
        scoreBar.setProgress(scoreBar.progress, animated: true)
        if scoreBar.progress < 0.7 {
            scoreBar.tintColor = UIColor.orange
        }
        if scoreBar.progress < 0.3 {
            scoreBar.tintColor = UIColor.red
        }
        if scoreBar.progress == 0.0 {
            scoreBar.progress = 1.0
            scoreBar.setProgress(scoreBar.progress, animated: false)
            scoreBar.tintColor = UIColor.green
            
        }
    }
    
    
    deinit {
        timerGame?.invalidate()
        timerWord?.invalidate()
    }
    
    func saveHighscore() {
               let encoder = JSONEncoder()
               if let encoded = try? encoder.encode(highScore) {
                   UserDefaults.standard.set(encoded, forKey: "userhighscores")
               }
           }
           
       func addHighscore(name: String, highscore: Int) {
           print("Lägger till användare: \(name) med poäng: \(highscore)")
           let newHighscore = User(name: name, highscore: highscore, score: 0)
           highScore.append(newHighscore) // Ändra här från user till highScore
           saveHighscore()
       }
            
       
       func loadHighscore() {
           if let savedHighscore = UserDefaults.standard.object(forKey: "userhighscores") as? Data {
               let decoder = JSONDecoder()
               if let loadedHighscore = try? decoder.decode([User].self, from: savedHighscore) {
                   highScore = loadedHighscore
                   highScore.sort { $0.highscore > $1.highscore }
                   print(highScore)
               }
           }
       }
           var counted: Int {
               return highScore.count
           }
       
           func highscoreEntry(at index: Int) -> User? {
               if index >= 0 && index < highScore.count {
                   print(highScore.count)
                   return highScore[index]
               }
               return nil
           }
       }
        
    
        
    
  
    /*
     // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
*/
