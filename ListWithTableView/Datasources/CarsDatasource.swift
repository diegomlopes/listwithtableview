//
//  CarsDatasource.swift
//  ListWithTableView
//
//  Created by Diego Lopes on 26/10/18.
//  Copyright © 2018 Diego Lopes. All rights reserved.
//

import UIKit

class CarsDatasource {
    
    static func getCars() -> [Car] {
        let car1 = Car(UIImage(named: "car1")!, "Car 1", "This is the car 1")
        let car2 = Car(UIImage(named: "car2")!, "Car 2", "This is the car 2")
        let car3 = Car(UIImage(named: "car3")!, "Car 3", "This is the car 3")
        let car4 = Car(UIImage(named: "car1")!, "Car 4", "This is the car 4")
        let car5 = Car(UIImage(named: "car2")!, "Car 5", "This is the car 5")
        let car6 = Car(UIImage(named: "car3")!, "Car 6", "This is the car 6")
        
        return [ car1, car2, car3, car4, car5, car6, car1, car2, car3, car4, car5, car6, car1, car2, car3, car4, car5, car6, car1, car2, car3, car4, car5, car6, car1, car2, car3, car4, car5, car6 ]
    }
}
