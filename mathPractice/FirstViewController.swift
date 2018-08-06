//
//  FirstViewController.swift
//  mathPractice
//
//  Created by Jenny Chen on 2018-08-05.
//  Copyright © 2018 Jenny Chen. All rights reserved.
//

import UIKit

var numberOfQuestions: Int = 0

class FirstViewController: UIViewController {

    // outlets
    
    @IBOutlet weak var numOfQuestionsLabel: UILabel!
    @IBOutlet weak var numOfQuestionsSlider: UISlider!
    
    
    // actions
 
    @IBAction func numOfQuestionsChanged(_ sender: UISlider) {
        numberOfQuestions = Int(sender.value)
        numOfQuestionsLabel.text = "\(numberOfQuestions) questions"
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

