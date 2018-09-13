//
//  ListViewController.swift
//  myMath
//
//  Created by Johnny on 2018/9/13.
//  Copyright © 2018年 MiaSheng. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {

    var numbers1=[Int]()
    var numbers2=[Int]()
    
    var answers = [String]()
    var isAddition = [Bool]()
    
    var calculatorResults = [Int]()
    var equations = [String]()
    
    let numberOfEquations = 20
    
    //for Print
    var htmlString = "<body><ol><big>"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Print", style: .plain, target: self, action: #selector(printTapped))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Renew", style: .plain, target: self, action: #selector(renewTapped))
        
        renewTapped()
    }
    
    @objc func renewTapped(){
        numbers1 = generateNumberArrays(anzahl: numberOfEquations)
        numbers2 = generateNumberArrays(anzahl: numberOfEquations)
        isAddition = generateBools(anzahl: numberOfEquations)
        
        calculatorResults = [Int]()
        equations = [String]()
        answers = [String]()
        //for Print
        htmlString = "<body><ol><big>"
        
        for i in 0 ..< numberOfEquations {
            answers.append("")
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
        
        for i in 0 ..< numberOfEquations {
            htmlString.append( "<li> \(equations[i]) </li>")
            
        }
        htmlString.append("</big></ol></body>")
        
        tableView.reloadData()
    }
    
    @objc func printTapped(){
        // 1
        let printController = UIPrintInteractionController.shared
        // 2
        let printInfo = UIPrintInfo(dictionary:nil)
        printInfo.outputType = UIPrintInfoOutputType.general
        printInfo.jobName = "print Job"
        printController.printInfo = printInfo
        
        // 3
        let formatter = UIMarkupTextPrintFormatter(markupText: htmlString)
        formatter.perPageContentInsets = UIEdgeInsets(top: 72, left: 72, bottom: 72, right: 72)
        printController.printFormatter = formatter
        
        // 4
        printController.present(animated: true, completionHandler: nil)
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


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return equations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EquationTableViewCell
        cell.equationLabel.text = equations[indexPath.row]
    
        cell.answer.text = answers[indexPath.row]
        
        cell.answer.tag = indexPath.row
        cell.answer.addTarget(self, action: #selector(textFieldChanged(textField:)), for: .allEditingEvents)
        self.colorTextField(textField: cell.answer, inputText: answers[indexPath.row], index: indexPath.row)
        return cell
    }
    

    //The textfield will be changed with the textfield
    @objc func textFieldChanged (textField textfield: UITextField){
        let index = textfield.tag
        if let inputText = textfield.text{
            answers.remove(at: index)
            answers.insert(inputText, at: index)
            self.colorTextField(textField: textfield, inputText: inputText, index: index)
        }
    }
    
    //According to the answer to show the background of textfield
    
    func colorTextField(textField:UITextField, inputText:String, index:Int) {
        let inputedValue = Int(inputText)
        if (inputedValue != nil && inputedValue == calculatorResults[index]) {
            textField.backgroundColor = UIColor.green
        }else{
            textField.backgroundColor = UIColor.red
        }
    }

}
