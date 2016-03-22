//
//  ViewController.swift
//  Calculator
//  Created by Mei Tao on 3/16/16.
//  Copyright © 2016 Mei Tao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var lastResult: Float = 0
    var lastNum: Float = 0
    var resultText = ""
    var operation: String = ""
    
    @IBAction func numberTapped(sender: UIButton) {
        guard let numText = sender.titleLabel?.text else {
            return
        }
        if resultText == String(lastResult) {
            resultText = ""
            lastResult = 0
            lastNum = 0
        }
        resultText = resultText + numText
        resultLabel.text = resultText
        lastNum = Float(resultText)!
        print("last num is \(lastNum), last result is \(lastResult)")
    }
    
    @IBAction func operatorTapped(sender: UIButton) {
        if lastResult == 0 {
            lastResult = lastNum
        }
        resultText = ""
        if sender.titleLabel?.text == "+" {
            operation = "plus"
        } else if sender.titleLabel?.text == "-" {
            operation = "minus"
        } else if sender.titleLabel?.text == "x" {
            operation = "times"
        } else if sender.titleLabel?.text == "÷" {
            operation = "divide"
        }
    }

    @IBAction func acTapped(sender: UIButton) {
        lastResult = 0
        resultLabel.text = "0"
        resultText = ""
    }
    
    @IBAction func cTapped(sender: UIButton) {
        if Float(resultText) == lastNum && resultText.characters.count >= 2 {
            resultText = String(resultText.characters.dropLast())
            resultLabel.text = resultText
            lastNum = Float(resultText)!
        } else if Float(resultText) == lastNum && resultText.characters.count == 1 {
            resultText = ""
            resultLabel.text = "0"
            lastNum = 0
        }
    }

    @IBAction func percentTapped(sender: UIButton) {
        if Float(resultText) == lastNum {
            lastNum = lastNum / 100
            resultText = String(lastNum)
        } else if Float(resultText) == lastResult {
            lastResult = lastResult / 100
            resultText = String(lastResult)
        }
        resultLabel.text = resultText
    }

    @IBAction func signTapped(sender: UIButton) {
        if Float(resultText) == lastNum {
            lastNum = -lastNum
            resultText = String(lastNum)
        } else if Float(resultText) == lastResult {
            lastResult = -lastResult
            resultText = String(lastResult)
        }
        resultLabel.text = resultText
    }
    
    @IBAction func decimalTapped(sender: UIButton) {
            resultText = resultText + "."
            resultLabel.text = resultText
    }
    
    @IBAction func equalTapped(sender: UIButton) {
        if operation == "" {
            return
        } else if operation == "plus" {
            lastResult = lastResult + lastNum
        } else if operation == "minus" {
            lastResult = lastResult - lastNum
        } else if operation == "times" {
            lastResult = lastResult * lastNum
        } else if operation == "divide" {
            lastResult = lastResult / lastNum
        }
        resultText = "\(lastResult)"
        resultLabel.text = resultText
        print("last num is \(lastNum), last result is \(lastResult)")
    }
}