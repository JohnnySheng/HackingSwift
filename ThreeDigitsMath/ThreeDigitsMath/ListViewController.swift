//
//  ListViewController.swift
//  ThreeDigitsMath
//
//  Created by Johnny on 2018/9/13.
//  Copyright © 2018年 MiaSheng. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {

    var numbers1=[Int]()
    var numbers2=[Int]()
    var isAddition = [Bool]()
    
    var calculatorResults = [Int]()
    var equations = [String]()
    
    let numberOfEquations = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    //The textfield will be changed with the textfield
    @objc func textFieldChanged (textField textfield: UITextField, atIndexPath indexPath:IndexPath){
        if let inputtext = textfield.text{
            let inputedValue = Int(inputtext)
            if(inputedValue == calculatorResults[indexPath.row]){
                textfield.backgroundColor = UIColor.green
            }else{
                textfield.backgroundColor = UIColor.red
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return equations.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailTableViewCell
        cell.equationLabel.text = equations[indexPath.row]
        cell.textField.addTarget(self, action: #selector(textFieldChanged(textField:atIndexPath:)), for: .allEditingEvents)
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
