//
//  Utilities.swift
//  TestApp1
//
//  Created by Varun Srivastava on 8/25/19.
//  Copyright © 2019 Varun Srivastava. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 35/255, green: 35/255, blue: 195/255, alpha: 1).cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 0/255, green: 37/255, blue: 255/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.init(red: 0/255, green: 37/255, blue: 255/255, alpha: 1).cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.init(red: 0/255, green: 253/255, blue: 255/255, alpha: 1)
    }

    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    static func isEmailValid(_ email : String) -> Bool {
        
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@",emailRegex).evaluate(with: email)
    }
    
    
    //Get the exact values
    
    static func carbonFootprintIncrease (_ type : String, _ amount : Int) -> Int {
        
        if (type == "Box") {
            let footprint = amount + 263
            return footprint
        }
        else if (type == "Milk") {
            let footprint = amount + 20
            return footprint
        }
        else if (type == "Bottle") {
            let footprint = amount + 83
            return footprint
        }
        else if (type == "Bag") {
            let footprint = amount + 200
            return footprint
        }
        else if (type == "Tree") {
            let footprint = amount + 21772
            return footprint
        }
        else {
            return 0
        }
    }
    static func carbonFootprintDecrease (_ type : String, _ amount : Int) -> Int {
        
        if (type == "Box") {
            let footprint = amount - 263
            return footprint
        }
        else if (type == "Milk") {
            let footprint = amount - 20
            return footprint
        }
        else if (type == "Bottle") {
            let footprint = amount - 83
            return footprint
        }
        else if (type == "Bag") {
            let footprint = amount - 200
            return footprint
        }
        else if (type == "Tree") {
            let footprint = amount - 21772
            return footprint
        }
        else {
            return 0
        }
    }
}

