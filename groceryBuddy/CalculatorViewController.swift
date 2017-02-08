//
//  CalculatorViewController.swift
//  groceryBuddy


import UIKit
import AVFoundation

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
    var result = ""
    

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
    
    @IBAction func divideBtnPressed(sender: AnyObject) {
        processOperation(op: Operation.Divide)
    }

    
    @IBAction func multiplyBtnPressed(sender: AnyObject) {
        processOperation(op: Operation.Multiply)
    }
    
    @IBAction func addBtnPressed(sender: AnyObject) {
        processOperation(op: Operation.Add)
    }
    
    
    @IBAction func subtractBtnPressed(sender: AnyObject) {
        processOperation(op: Operation.Subtract)
    }
    
    @IBAction func equalBtnPressed(sender: AnyObject) {
        processOperation(op: currentOperation)
    }
    
      @IBAction func clearButtonPressed(sender: AnyObject) {
        outputLbl.text = "0"
        runningNum = ""
        leftNum = ""
        rightNum = ""
        result = ""
        currentOperation = Operation.Empty
    }
    
    func processOperation(op: Operation){
        if currentOperation != Operation.Empty {
            if runningNum != "" {
                rightNum = runningNum
                runningNum = ""
            
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftNum)! * Double(rightNum)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftNum)! / Double(rightNum)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftNum)! - Double(rightNum)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftNum)! + Double(rightNum)!)"
                }
                leftNum = result
                outputLbl.text = result
            }
                currentOperation = op
            
        } else {
            leftNum = runningNum
            runningNum = ""
            currentOperation = op
    
        }
    }
}
