//
//  CalcData.swift
//  DiscountCalculator
//
//  Created by user on 3/13/17.
//  Copyright © 2017 Tevisophea. All rights reserved.
//

import UIKit

class CalcData {
    
    //similar to a global variabl, singleton pattern
    static let shared = CalcData()

    var price: Float
    var dollarOff: Float
    var discount: Float
    var ODiscount: Float
    var tax: Float
    
    init() {
        price = 0.0
        dollarOff = 0.0
        discount = 0.0
        ODiscount = 0.0
        tax = 0.0
    }
    
    
    //Calculate the Original and Discounted Price
    func OriginalPrice () -> Float {
        let  origPrice = price + (price * (tax/100))
        return origPrice
    }
    
    func DiscountPrice () -> Float {
        let discPrice = price - dollarOff - (price * (discount + ODiscount)/100) + (price * (tax/100))
        return discPrice
    }
    
    func youSaved () -> Float {
        let priceSaved = dollarOff + (price * ((discount + ODiscount)/100))
        return priceSaved
    }
    
    func youSavedPerc () -> Float {
        let percSaved = 100 - youPayPerc()
        return percSaved
        
    }
    
    func youPayPerc () -> Float {
        let percPaid = (DiscountPrice()/OriginalPrice()) * 100
        return percPaid
    }
    
    func youPay () -> Float {
        let youPaid = OriginalPrice() - youSaved()
        return youPaid
    }
    
}

