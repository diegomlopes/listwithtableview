//
//  CarsDatasource.swift
//  ListWithTableView
//
//  Created by Diego Lopes on 26/10/18.
//  Copyright © 2018 Diego Lopes. All rights reserved.
//

import UIKit

class CarsDatasource {
    
    /// Return the cars of a section
    ///
    /// - Parameter section: car's section
    /// - Returns: all cars in a section
    static func getCars(from section: String) -> [Car] {
        if section == "Recommendeds" {
            return getCarsRecommendeds()
        } else if section == "Most Viewds" {
            return getCarsMostViewds()
        } else {
            return getAllCars()
        }
    }
    
    /// Return recommendeds cars
    ///
    /// - Returns: recommendeds cars
    private static func getCarsRecommendeds() -> [Car] {
        let car1 = Car(UIImage(named: "car1")!, "Car 1", "This is the car 1")
        let car2 = Car(UIImage(named: "car2")!, "Car 2", "This is the car 2")
        let car3 = Car(UIImage(named: "car3")!, "Car 3", "This is the car 3")
        
        return [ car1, car2, car3 ]
    }
    
    /// Return most viewds cars
    ///
    /// - Returns: most viewds cars
    private static func getCarsMostViewds() -> [Car] {
        let car1 = Car(UIImage(named: "car1")!, "Car 1", "This is the car 1")
        let car2 = Car(UIImage(named: "car2")!, "Car 2", "This is the car 2")
        let car3 = Car(UIImage(named: "car3")!, "Car 3", "This is the car 3")
        
        return [ car1, car2, car3 ]
    }
    
    /// Return all cars
    ///
    /// - Returns: all cars
    private static func getAllCars() -> [Car] {
        let car1 = Car(UIImage(named: "car1")!, "Car 1", "This is the car 1")
        let car2 = Car(UIImage(named: "car2")!, "Car 2", "This is the car 2")
        let car3 = Car(UIImage(named: "car3")!, "Car 3", "This is the car 3")
        
        return [ car1, car2, car3 ]
    }
    
    
}
