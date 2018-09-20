//
//  Bicycle.swift
//  Inheritance
//
//  Created by Johnny on 2018/9/14.
//  Copyright © 2018年 MiaSheng. All rights reserved.
//

import UIKit

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }

}

class Tandem: Bicycle {
    override init() {
        super.init()
        maxPassengers = 2
    }
}
