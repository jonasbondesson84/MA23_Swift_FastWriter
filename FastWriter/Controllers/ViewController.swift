//
//  ViewController.swift
//  FastWriter
//
//  Created by Jonas Bondesson on 2024-03-28.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{
    
  
    
    var getUserName = PlayViewController()
    var highScore = PlayViewController()
    let modes = ["Easy","Medium","Hard"]
    var selectedMode: String?
    
    @IBOutlet weak var changeName: UITextField!
    
    @IBOutlet weak var modeSelector: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        highScore.loadHighscore()
        changeName.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        modeSelector.dataSource = self
        modeSelector.delegate = self
        selectedMode = modes.first
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
            destinationVC.selectedMode = selectedMode
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return modes.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return modes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedMode = modes[row]
        print("Selected mode: \(selectedMode)")
    }
    
}







