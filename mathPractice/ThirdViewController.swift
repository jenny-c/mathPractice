//
//  ThirdViewController.swift
//  mathPractice
//
//  Created by Jenny Chen on 2018-08-09.
//  Copyright © 2018 Jenny Chen. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    // variables
    
    var totalNumberAnswered: Int = 0
    var totalNumberWrong: Int = 0
    var totalMultiplication: Int = 0
    var totalDivision: Int = 0
    var multiplicationWrong: Int = 0
    var divisionWrong: Int = 0
    
    
    // outlets
    
    @IBOutlet weak var percentageWrongLabel: UILabel! {
        didSet {
            percentageWrongLabel.text = "\(totalNumberWrong)\\\(totalNumberAnswered)"
        }
    }
    @IBOutlet weak var totalAnsweredLabel: UILabel! {
        didSet {
            totalAnsweredLabel.text = String(totalNumberAnswered)
        }
    }
    @IBOutlet weak var multiplicationWrongLabel: UILabel! {
        didSet {
            multiplicationWrongLabel.text = "\(multiplicationWrong)\\\(totalMultiplication)"
        }
    }
    @IBOutlet weak var divisionWrongLabel: UILabel! {
        didSet {
            divisionWrongLabel.text = "\(divisionWrong)\\\(totalDivision)"
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
