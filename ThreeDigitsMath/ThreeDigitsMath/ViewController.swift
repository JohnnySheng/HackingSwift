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
    
    var calculatorResults = [Int]()
    var equations = [String]()
    
    let numberOfEquations = 20

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        numbers1 = generateNumberArrays(anzahl: numberOfEquations)
        numbers2 = generateNumberArrays(anzahl: numberOfEquations)
        isAddition = generateBools(anzahl: numberOfEquations)
        
        for i in 0 ..< numberOfEquations {
            if(isAddition[i]){
                calculatorResults.append(numbers1[i] + numbers2[i])
                equations.append("\(numbers1[i]) + \(numbers2[i]) = ")
            }else if (!isAddition[i] && numbers1[i] < numbers2[i]){
                calculatorResults.append(numbers2[i] - numbers1[i])
                equations.append("\(numbers2[i]) - \(numbers1[i]) = ")
            }else{
                calculatorResults.append(numbers1[i] - numbers2[i])
                equations.append("\(numbers1[i]) - \(numbers2[i]) = ")
            }
        }
        print(calculatorResults)
        print(equations)
        
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

