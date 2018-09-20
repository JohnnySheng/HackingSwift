//
//  Person.swift
//  Inheritance
//
//  Created by Johnny on 2018/9/17.
//  Copyright © 2018年 MiaSheng. All rights reserved.
//

import UIKit

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is bering initialized!")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }

}
