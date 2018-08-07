//
//  SecondViewController.swift
//  mathPractice
//
//  Created by Jenny Chen on 2018-08-05.
//  Copyright © 2018 Jenny Chen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    // declare variables
    
    var numOfQuestions: Int = 0
    var correctAnswer: Int = 0
    var correctAnswerCount: Int = 0
    var numOfTries: Int = 0
    
    var firstNum: Int = 0
    var secondNum: Int = 0
    var equation: String = ""
    
    var fractionsON: Bool = false
    var exponentsON: Bool = false
    var decimalsON:Bool = false
    
    
    
    // outlets

    @IBOutlet weak var questionsLeftLabel: UILabel! {
        didSet {
            questionsLeftLabel.text = String(numOfQuestions)
        }
    }
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel! {
        didSet {
            questionLabel.text = generateEquation()
        }
    }
    
    
    func generateEquation() -> String {
        firstNum = Int(arc4random_uniform(250))+1
        secondNum = Int(arc4random_uniform(250))+1
        
        let operatorNumber = Int(arc4random_uniform(2))
        if operatorNumber == 0 {
            correctAnswer = firstNum * secondNum
            return "\(firstNum) * \(secondNum)"
        } else {
            if firstNum < secondNum {
                let tempNum = firstNum
                firstNum = secondNum
                secondNum = tempNum
            }
            correctAnswer = firstNum / secondNum
            return "\(firstNum) / \(secondNum)"
        }
    }
    
    
    // actions
    
    @IBAction func submitPressed(_ sender: UIButton) {
        if let userAnswer = Int(answerTextField.text!) {
            if userAnswer == correctAnswer {
                if numOfTries < 3 {
                    numOfQuestions -= 1
                    questionsLeftLabel.text = String(numOfQuestions)
                }
                numOfTries = 0
                answerTextField.text = ""
                questionLabel.text = generateEquation()
            } else {
                numOfTries += 1
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
