//
//  Customer.swift
//  Inheritance
//
//  Created by Johnny on 2018/9/17.
//  Copyright © 2018年 MiaSheng. All rights reserved.
//

import UIKit

class Customer: NSObject {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class  CreditCard{
    let number: Int
    unowned let customer: Customer
    init(number: Int, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}
