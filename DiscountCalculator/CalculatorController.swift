//  CalculatorController.swift
//  DiscountCalculator
//
//  Created by user on 3/12/17.
//  Copyright © 2017 Tevisophea. All rights reserved.
//

import UIKit

class CalculatorController: UIViewController {
    
     let cData = CalcData.shared
    
    @IBOutlet weak var priceTextField: UITextField!
    
    @IBOutlet weak var DOffTextField: UITextField!
    
    @IBOutlet weak var discountTextField: UITextField!
    
    @IBOutlet weak var oDiscountTextField: UITextField!
    
    @IBOutlet weak var taxTextField: UITextField!
    
    @IBOutlet weak var OrigLabel: UILabel!
    
    @IBOutlet weak var DiscLabel: UILabel!
    

    
    
    @IBAction func unwindToCalc( segue: UIStoryboardSegue) {
        getValues()
        printValues()
        
    }
    
    //obtain the values from user input store in cData
    func getValues () {
        cData.price = Float(priceTextField.text!)!
        cData.dollarOff = Float(DOffTextField.text!)!
        cData.discount = Float(discountTextField.text!)!
        cData.ODiscount = Float(oDiscountTextField.text!)!
        cData.tax = Float(taxTextField.text!)!
    }
    
    func printValues () {
        OrigLabel.text = "$\(cData.OriginalPrice())"
        DiscLabel.text = "$\(cData.DiscountPrice())"
    }

}
