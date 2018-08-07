//
//  FirstViewController.swift
//  mathPractice
//
//  Created by Jenny Chen on 2018-08-05.
//  Copyright © 2018 Jenny Chen. All rights reserved.
//

import UIKit

var numberOfQuestions: Int = 50
var fractionsON: Bool = false
var exponentsON: Bool = false
var decimalsON: Bool = false

class FirstViewController: UIViewController {

    // outlets
    
    @IBOutlet weak var numOfQuestionsLabel: UILabel!
    @IBOutlet weak var numOfQuestionsSlider: UISlider!
    
    @IBOutlet weak var fractionsSwitch: UISwitch!
    @IBOutlet weak var exponentsSwitch: UISwitch!
    @IBOutlet weak var decimalsSwitch: UISwitch!
    
    
    
    
    // actions
 
    @IBAction func numOfQuestionsChanged(_ sender: UISlider) {
        numberOfQuestions = Int(sender.value)
        numOfQuestionsLabel.text = "\(numberOfQuestions) questions"
    }
    
    @IBAction func fractionsSwitchChanged(_ sender: UISwitch) {
        if (sender.isOn) {
            fractionsON = true
        } else {
            fractionsON = false
        }
    }
    
    @IBAction func exponentsSwitchChanged(_ sender: UISwitch) {
        if (sender.isOn) {
            exponentsON = true
        } else {
            exponentsON = false
        }
    }
    
    @IBAction func decimalsSwitchChanged(_ sender: UISwitch) {
        if (sender.isOn) {
            decimalsON = true
        } else {
            decimalsON = false
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // segue to SecondViewController (questions)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let questionView = segue.destination as! SecondViewController

        questionView.numOfQuestions = numberOfQuestions
        questionView.fractionsON = fractionsON
        questionView.exponentsON = exponentsON
        questionView.decimalsON = decimalsON
    }


}

