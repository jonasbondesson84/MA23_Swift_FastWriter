//
//  PlayViewController.swift
//  FastWriter
//
//  Created by Jonas Bondesson on 2024-03-28.
//

import UIKit

class PlayViewController: UIViewController, UITextFieldDelegate  {
    
    var user = User(name: "Jonas", highscore: 0, timeLeft: 30.0)
    
    var word = Word()
    var time = TimeInterval(30)
    var timer: Timer?
    let formatter = DateComponentsFormatter()

    @IBOutlet weak var timeLeft: UILabel!
    @IBOutlet weak var answerWord: UITextField!
    @IBOutlet weak var currentWord: UILabel!
    @IBOutlet weak var score: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerWord.delegate = self
        answerWord.becomeFirstResponder()
        
        randomWord()
    
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: changeTime(timer:))
        
    }
    
    func changeTime(timer: Timer?) {
        if time > 0 {
            time -= 1
            timeLeft.text = formatter.string(from: time)
        } else {
            
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == currentWord.text {
            randomWord()
            textField.text = ""
        }
        return true
        
    }
    
    func randomWord() {
        if let randomWord = word.getRandomWord() {
            user.highscore += 10
            currentWord.text = randomWord.word
    
        } else {
            currentWord.text = "Oops! Inga fler ord!"
        }
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
