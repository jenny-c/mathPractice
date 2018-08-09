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
    var wrongAnswerCount: Int = 0
    var numOfTries: Int = 0
    
    var firstNum: Int = 0
    var secondNum: Int = 0
    var equation: String = ""
    
    var fractionsON: Bool = false
    var exponentsON: Bool = false
    var decimalsON:Bool = false
    
    var operatorNumber: Int = 0
    
    var totalNumberAnswered: Int = numberOfQuestions
    var totalMultiplication: Int = 0
    var totalDivision: Int = 0
    var multiplicationWrong: Int = 0
    var divisionWrong: Int = 0
    
    
    // outlets

    @IBOutlet weak var questionsLeftLabel: UILabel! {
        didSet {
            questionsLeftLabel.text = String(numOfQuestions)
        }
    }
    @IBOutlet weak var questionsWrongLabel: UILabel! {
        didSet {
            questionsWrongLabel.text = String(wrongAnswerCount)
        }
    }
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var finishButton: UIButton! {
        didSet {
            finishButton.isHidden = true
        }
    }
    @IBOutlet weak var questionLabel: UILabel! {
        didSet {
            questionLabel.text = generateEquation()
        }
    }
    
    
    func generateEquation() -> String {
        firstNum = Int(arc4random_uniform(250))+1
        secondNum = Int(arc4random_uniform(250))+1
        
        operatorNumber = Int(arc4random_uniform(2))
        if operatorNumber == 0 {
            // multiplication
            correctAnswer = firstNum * secondNum
            totalMultiplication += 1
            return "\(firstNum) * \(secondNum)"
        } else {
            // division
            // rearrange numbers so denominator is smaller than numerator
            if firstNum < secondNum {
                let tempNum = firstNum
                firstNum = secondNum
                secondNum = tempNum
            }
            correctAnswer = firstNum / secondNum
            totalDivision += 1
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
                } else {
                    totalNumberAnswered += 1
                }
                numOfTries = 0
                answerTextField.text = ""
                
                // finish practice when done
                if numOfQuestions == 0 {
                    submitButton.isHidden = true
                    finishButton.isHidden = false
                    questionLabel.text = ""
                } else {
                    questionLabel.text = generateEquation()
                }
            } else {
                numOfTries += 1
                if numOfTries == 1 {
                    wrongAnswerCount += 1
                    if operatorNumber == 0 {
                        multiplicationWrong += 1
                    } else {
                        divisionWrong += 1
                    }
                    questionsWrongLabel.text = String(wrongAnswerCount)
                }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let statistics = segue.destination as! ThirdViewController
        
        statistics.totalNumberAnswered = totalNumberAnswered
        statistics.totalNumberWrong = wrongAnswerCount
        statistics.totalMultiplication = totalMultiplication
        statistics.totalDivision = totalDivision
        statistics.multiplicationWrong = multiplicationWrong
        statistics.divisionWrong = divisionWrong
        
    }
    

}
