//
//  ViewController.swift
//  FastWriter
//
//  Created by Jonas Bondesson on 2024-03-28.
//

import UIKit

class ViewController: UIViewController {
    var getUserName = PlayViewController()
    var highScore = PlayViewController()
    @IBOutlet weak var changeName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        highScore.loadHighscore()
        changeName.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
    
@objc func textFieldDidChange(_ textField: UITextField) {
     if let newName = textField.text {
         getUserName.user.name = newName
         print("Användarens nya namn är: \(getUserName.user.name)")
     }
 }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playSegueID",
           let destinationVC = segue.destination as? PlayViewController {
            if let newName = changeName.text {
                destinationVC.user.name = newName
            }
        }
    }
}






