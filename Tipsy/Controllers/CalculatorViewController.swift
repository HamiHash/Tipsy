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
    var splitNumber: Int = 0
    var finalAmount: Float = 0.0
    var tip: Int = 0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextFiled.endEditing(true)
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
        billTextFiled.endEditing(true)
        splitNumber = Int(sender.value)
        splitNumberLable.text = String(splitNumber)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        tip = Int(selectedTip.dropLast(1))!
        let bill: Float = Float(billTextFiled.text!)!
        let tipPlusBill = (bill * Float(tip) / 100) + bill
        finalAmount = tipPlusBill / Float(splitNumber)

        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.label = String(finalAmount)
            destinationVC.setting = "Split between \(splitNumber) people with \(tip)% tip."
        }
    }
}
