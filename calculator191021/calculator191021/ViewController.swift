//
//  ViewController.swift
//  calculator191021
//
//  Created by Сережа Хазов on 19.10.2021.
//

import UIKit

class ViewController: UIViewController {

    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var typingNumber = false
    var mathematicSign = ""
    
    @IBOutlet weak var resultDisplay: UILabel!
    
    
    @IBAction func pressingNumberButton(_ sender: UIButton) {
        if typingNumber {
            resultDisplay.text = resultDisplay.text! + sender.currentTitle!
        } else {
        resultDisplay.text = sender.currentTitle!
            typingNumber = true
    }
    }
    
    @IBAction func pressingMathematicSignButton(_ sender: UIButton) {
        mathematicSign = sender.currentTitle!
        firstOperand = Double (resultDisplay.text!)!
        typingNumber = false
        
    }
    
    @IBAction func pressingEqualityButton(_ sender: UIButton) {
        if typingNumber {
            secondOperand = Double (resultDisplay.text!)!
            switch mathematicSign {
            case "+":
                resultDisplay.text = String (firstOperand + secondOperand)
            case "-":
                resultDisplay.text = String (firstOperand - secondOperand)
            case "×":
                resultDisplay.text = String (firstOperand * secondOperand)
            case "÷":
                resultDisplay.text = String (firstOperand / secondOperand)
            default: break
            }
        }
    }
    
    @IBAction func pressingClearButton(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        typingNumber = false
        mathematicSign = ""
        resultDisplay.text = "0"
    }
    
    @IBAction func pressingPlusMinusButton(_ sender: UIButton) {
        firstOperand = -(Double (resultDisplay.text!)!)
        resultDisplay.text = String (firstOperand)
    }
    
    @IBAction func pressingSecondDegreeButton(_ sender: UIButton) {
        firstOperand = Double (resultDisplay.text!)! * Double (resultDisplay.text!)!
        resultDisplay.text = String (firstOperand)
    }
    
    @IBAction func pressingSquarRootButton(_ sender: UIButton) {
        firstOperand = sqrt(Double (resultDisplay.text!)!)
        resultDisplay.text = String (firstOperand)
    }
    
    @IBAction func pressingDotButton(_ sender: UIButton) {
        resultDisplay.text = resultDisplay.text! + "."
    }
}

