//
//  DetailViewController.swift
//  ThreeDigitsMath
//
//  Created by Johnny on 2018/9/12.
//  Copyright © 2018年 MiaSheng. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    var numbers1=[Int]()
    var numbers2=[Int]()
    var isAddition = [Bool]()
    
    var calculatorResults = [Int]()
    var equations = [String]()
    
    let numberOfEquations = 20

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
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

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
