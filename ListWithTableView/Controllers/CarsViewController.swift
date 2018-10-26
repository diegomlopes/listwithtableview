//
//  ViewController.swift
//  ListWithTableView
//
//  Created by Diego Lopes on 26/10/18.
//  Copyright © 2018 Diego Lopes. All rights reserved.
//

import UIKit

class CarsViewController: UIViewController {

    var cars = CarsDatasource.getCars()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension CarsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath) as! CarsTableViewCell
        
        cell.photoImageView.image = cars[indexPath.row].image
        cell.nameTextLabel.text = cars[indexPath.row].name
        cell.descriptionTextLabel.text = cars[indexPath.row].description
        
        return cell
    }
    
    
}
