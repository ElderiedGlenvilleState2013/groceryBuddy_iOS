//
//  CalculatorViewController.swift
//  groceryBuddy
//
//  Created by RubyThree on 12/19/16.
//  Copyright © 2016 RubyThree. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Add = "+"
        case Subtract = "-"
        case Empty = "Empty"
    }
    
    var runningNum = ""
    var currentOperation: Operation = Operation.Empty
    var leftNum = ""
    var rightNum = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numberPressed(btn: UIButton){
        runningNum += "\(btn.tag)"
        outputLbl.text = runningNum
    }
    
    @IBAction func divideBtnPressed(_ sender: UIButton) {
    }

    
    @IBAction func multiplyBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func addBtnPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func subtractBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func equalBtnPressed(_ sender: UIButton) {
    }
    
      @IBAction func clearButtonPressed(_ sender: UIButton) {
        outputLbl.text = "0"
        runningNum = ""
    }

}
