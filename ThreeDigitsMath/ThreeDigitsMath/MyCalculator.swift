//
//  MyCalculator.swift
//  ThreeDigitsMath
//
//  Created by Johnny on 2018/9/12.
//  Copyright © 2018年 MiaSheng. All rights reserved.
//

import UIKit

class MyCalculator: NSObject {

    static func generateRandomNumber(numDigits:Int) -> Int {
        var place  = 1
        var finalNumber = 0
        
        for i in 0 ..< numDigits {
            var randomNumber = Int(arc4random_uniform(10))
            while (i == numDigits - 1 && randomNumber == 0){
                randomNumber = Int(arc4random_uniform(10))
            }
            print(randomNumber)
            finalNumber += randomNumber * place
            place *= 10
        }
        return finalNumber
    }
    
    static func randomBool() -> Bool {
        return arc4random_uniform(2) == 0
    }
}
