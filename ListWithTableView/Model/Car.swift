//
//  Car.swift
//  ListWithTableView
//
//  Created by Diego Lopes on 26/10/18.
//  Copyright © 2018 Diego Lopes. All rights reserved.
//

import UIKit

class Car {
    var image: UIImage
    var name: String
    var description: String
    
    init(_ image: UIImage, _ name: String, _ description: String) {
        self.image = image
        self.name = name
        self.description = description
    }
}
