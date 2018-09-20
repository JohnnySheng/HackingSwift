//
//  ViewController.swift
//  Inheritance
//
//  Created by Johnny on 2018/9/14.
//  Copyright © 2018年 MiaSheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let vehicle = Vehicle()
        let bike = Bicycle()
        let tandem = Tandem()
        let car = Car()
        let speedLimitedCar = SpeedLimitedCar()
        speedLimitedCar.speed = 60
        
        let automaticCar = AutomaticCar()
        automaticCar.speed = 35
        
        print(vehicle.description())
        print(bike.description())
        print(tandem.description())
        print(car.description())
        print(speedLimitedCar.description())
        print(automaticCar.description())
        
        var reference1: Person?
        var reference2: Person?
        var reference3: Person?
        
        reference1 = Person(name: "John Appleseed")
        reference2 = reference1
        reference3 = reference1
        print(reference1?.name ?? "default")
        print(reference2?.name ?? "default")
        print(reference3?.name ?? "default")
        reference1 = nil
        reference2 = nil
        print("Middle")
        reference3 = nil
        print("End")
        
        var john: Customer?
        john = Customer(name: "John Smith")
        john!.card = CreditCard(number: 12312312, customer: john!)
        john = nil
        print("End2")
        
        var country = Country(name: "China", capitalName: "Beijing")
        var beijing = City(name: "Beijing", country: country)
        
        print("End3")
        print("End4")
        print("End5")
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

