//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextFiled: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLable: UILabel!
    
    var selectedTip: String = ""
    var splitNumber: Double = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        // deselecting other buttons (if)
        if zeroPctButton.isSelected {
            zeroPctButton.isSelected = false
        } else if tenPctButton.isSelected {
            tenPctButton.isSelected = false
        } else if twentyPctButton.isSelected {
            twentyPctButton.isSelected = false
        }
        
        // selecting new button
        if sender.isSelected {
            sender.isSelected = false
        } else if !sender.isSelected {
            sender.isSelected = true
        }
        
        // setting the tip value to selectedTip varible
        selectedTip = sender.titleLabel?.text ?? "No tip selected"
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumber = Double(round(0.1 * sender.value) / 0.1)
        splitNumberLable.text = String(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(splitNumber)
        switch selectedTip {
            case "0%":
                print(0.0)
            case "10%":
                print(0.1)
            case "20%":
                print(0.2)
            default:
                print("default")
            }
    }
}

