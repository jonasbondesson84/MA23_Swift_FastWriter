//
//  ViewController.swift
//  FastWriter
//
//  Created by Jonas Bondesson on 2024-03-28.
//

import UIKit

class ViewController: UIViewController {

    var highScore = PlayViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        highScore.loadHighscore()
    }


}

