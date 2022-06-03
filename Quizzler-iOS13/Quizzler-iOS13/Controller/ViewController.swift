//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    var timer = Timer()
    
    
    var quizbrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
        let userAnswer = sender.currentTitle!
        let userGotIT = quizbrain.checkAnswer(userAnswer)
        
        
        if userGotIT {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        
        quizbrain.nextQuestion()
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
    }
    
    
    @objc func updateUI() {
        questionLabel.text = quizbrain.getQuestionText()
        thirdButton.backgroundColor = UIColor.clear
        trueButton.backgroundColor  = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        scoreLabel.text = "Score: \(quizbrain.getScore())"
        progressBar.progress = quizbrain.getProgress()
        let answerChoices = quizbrain.getAnswer()
        thirdButton.setTitle(answerChoices[0], for: .normal)
        trueButton.setTitle(answerChoices[1], for: .normal)
        falseButton.setTitle(answerChoices[2], for: .normal)
    }

}

