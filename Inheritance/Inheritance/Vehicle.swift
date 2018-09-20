//
//  Vehicle.swift
//  Inheritance
//
//  Created by Johnny on 2018/9/14.
//  Copyright © 2018年 MiaSheng. All rights reserved.
//

import UIKit

class Vehicle{
    var numberOfWheels: Int
    var maxPassengers: Int
    
    func description() -> String {
        return "\(numberOfWheels) wheels, up to \(maxPassengers) passengers"
    }
    
    init() {
        numberOfWheels = 0
        maxPassengers = 1
    }

}

class Car: Vehicle {
    var speed: Double = 0.0
    override init() {
        super.init()
        maxPassengers = 5
        numberOfWheels = 4
    }
    
    override func description() -> String {
        return super.description() + ";" + "traveling at \(speed) mph"
    }
    
}

class SpeedLimitedCar: Car {
    override var speed: Double{
        get{
            return super.speed
        }
        set{
            super.speed = min(newValue, 40)
        }
    }
}

class AutomaticCar: Car {
    var gear = 1
    
    override var speed: Double{
        didSet{
            gear = Int(speed/10.0) + 1
        }
    }
    
    override func description() -> String {
        return super.description() + "in gear \(gear)"
    }
}
