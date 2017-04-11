//
//  Graph.swift
//  DiscountCalculator
//
//  Created by user on 3/13/17.
//  Copyright © 2017 Tevisophea. All rights reserved.
//

import UIKit

extension CGContext {
    func setFillColor(_ hex:Int) {
        //mask different values of the hex code
        // 0xFF0000 - Red
        // 0x00FF00 - Green
        // 0x0000FF - Blue
        
        //bit shift
        //FF0000 --> 0000FF (you only want the last FF)
        let redColor:CGFloat = CGFloat((hex >> 16) & 0xFF) / 255.0
        let greenColor:CGFloat = CGFloat((hex >> 8) & 0xFF) / 255.0
        let blueColor:CGFloat = CGFloat(hex & 0xFF) / 255.0
        
        setFillColor(red: redColor, green: greenColor, blue: blueColor, alpha:1.0)
        
    }
}

class Graph: UIView {

    let calcD = CalcData.shared
    
    override func draw(_ rect: CGRect) {
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        let leftGuide:CGFloat = 16.0
        let rightGuide:CGFloat = screenWidth - 16.0
        let topGuide:CGFloat = 64.0 + 16.0 //72.0
        let botGuide:CGFloat = screenHeight - 16.0
        
        //comment out below due to the extension
        //alpha is the transparency therefore 1.0 is solid
        //context.setFillColor(red: 0.85, green: 0.40, blue: 0.25, alpha: 1.0)
        
        //DRAW RECTANGLE
        //context.fillCGRect(x:,y:,width:,height:)
        //display original price
        context.setFillColor(0xEC7063)
        context.fill(CGRect(x:leftGuide, y:topGuide, width: rightGuide - 16.0, height: botGuide - 72.0))
        
        context.setFillColor(0x45B39D)
        context.fill(CGRect(x:rightGuide/2, y:topGuide, width: rightGuide/2, height: botGuide))
        
        context.setFillColor(0x2E4053)
        context.fill(CGRect(x:rightGuide/2, y:350.0, width: rightGuide/2, height: botGuide))
        //DRAW TEXT
        let OGText = "Original Price"
        let OGprice = "$\(calcD.OriginalPrice())"
        
        let YSText = "You Saved"
        let YSprice = "$\(calcD.youSaved())"
        let YSperc = "\(calcD.youSavedPerc())%"
        
        let YPText = "You Pay"
        let YPprice = "$\(calcD.youPay())"
        let YPperc = "\(calcD.youPayPerc())%"
        
        //TEXT ATTRIBUTES
        let textAttributes = [
            NSFontAttributeName: UIFont(name: "Helvetica Bold", size: 16.0)!,
            NSForegroundColorAttributeName: UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        ]
        
        let OGTextPos: CGPoint = CGPoint(x: leftGuide + 16.0, y: topGuide + 16.0)
        OGText.draw(at: OGTextPos, withAttributes: textAttributes)
        OGprice.draw(at: CGPoint(x: leftGuide + 16.0, y: topGuide + 32.0), withAttributes: textAttributes)
        
        let YSTextPos: CGPoint = CGPoint(x: rightGuide/2 + 16.0, y: topGuide + 16.0)
        YSText.draw(at: YSTextPos, withAttributes: textAttributes)
        YSprice.draw(at: CGPoint(x: rightGuide/2 + 16.0, y: topGuide + 32.0), withAttributes: textAttributes)
        YSperc.draw(at: CGPoint(x: rightGuide/2 + 16.0, y: topGuide + 48.0), withAttributes: textAttributes)
        
        let YPTextPos: CGPoint = CGPoint(x: rightGuide/2 + 16.0, y: 350.0 + 16.0)
        YPText.draw(at: YPTextPos, withAttributes: textAttributes)
        YPprice.draw(at: CGPoint(x: rightGuide/2 + 16.0, y: 350.0 + 32.0), withAttributes: textAttributes)
        YPperc.draw(at: CGPoint(x: rightGuide/2 + 16.0, y: 350.0 + 48.0), withAttributes: textAttributes)

        
    }

}
