//
//  PlayViewController.swift
//  FastWriter
//
//  Created by Jonas Bondesson on 2024-03-28.
//

import UIKit

class PlayViewController: UIViewController, UITextFieldDelegate  {
    
    var word = Word()

    @IBOutlet weak var answerWord: UITextField!
    @IBOutlet weak var currentWord: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        answerWord.delegate = self
        answerWord.becomeFirstResponder()
        randomWord()
    
        
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
