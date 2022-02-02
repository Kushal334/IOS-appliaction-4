//
//  ViewController.swift
//  Calculator
//
//  Created by Christos Sotirelis on 24/06/2017.
//  Copyright © 2017 Christos Sotirelis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var isUserTyping = false
    
    // Some random comment
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if isUserTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            isUserTyping = true
        }
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain: CalculatorBrain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if isUserTyping {
            brain.setOperand(displayValue)
            isUserTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        if let result = brain.result {
            displayValue = result
        }
    }
}

