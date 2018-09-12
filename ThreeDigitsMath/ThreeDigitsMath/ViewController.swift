//
//  ViewController.swift
//  ThreeDigitsMath
//
//  Created by Johnny on 2018/9/12.
//  Copyright © 2018年 MiaSheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numbers1=[Int]()
    var numbers2=[Int]()
    var isAddition = [Bool]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numbers1 = generateNumberArrays(anzahl: 20)
        numbers2 = generateNumberArrays(anzahl: 20)
        isAddition = generateBools(anzahl: 20)
        
        print(numbers1)
        print(numbers2)
        print(isAddition)
        
    }

    func generateNumberArrays(anzahl: Int) -> [Int] {
        var results = [Int]()
        for _ in 0 ..< anzahl {
            results.append( MyCalculator.generateRandomNumber(numDigits: 3))
        }
        return results
    }
    
    func generateBools(anzahl: Int) -> [Bool] {
        var results = [Bool]()
        for _ in 0 ..< anzahl {
            results.append(MyCalculator.randomBool())
        }
        return results
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    

}

