//
//  Country.swift
//  Inheritance
//
//  Created by Johnny on 2018/9/17.
//  Copyright © 2018年 MiaSheng. All rights reserved.
//

import UIKit

class Country{
    let name: String
    private var _capitalCity: City!
    var capitalCity: City {
        return _capitalCity
    }
    
    init(name: String, capitalName: String) {
        self.name = name
        self._capitalCity = City(name: capitalName, country: self)
    }

}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}
