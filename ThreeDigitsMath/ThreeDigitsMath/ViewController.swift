//
//  ViewController.swift
//  ThreeDigitsMath
//
//  Created by Johnny on 2018/9/12.
//  Copyright © 2018年 MiaSheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        
    }

    
    
    @IBAction func startButtonPressed(_ sender: Any) {
        let detailVC = ListViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    

}

