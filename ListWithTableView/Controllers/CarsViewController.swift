//
//  CarsViewController.swift
//  ListWithTableView
//
//  Created by Diego Lopes on 26/10/18.
//  Copyright © 2018 Diego Lopes. All rights reserved.
//

import UIKit

class CarsViewController: UIViewController {

    var sections = ["Recommendeds", "Most Viewds", "All" ]
    var cars = [ CarsDatasource.getCars(from: "Recommendeds"), CarsDatasource.getCars(from: "Most Viewds"), CarsDatasource.getCars(from: "All") ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension CarsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath) as! CarsTableViewCell
        
        cell.photoImageView.image = cars[indexPath.section][indexPath.row].image
        cell.nameTextLabel.text = cars[indexPath.section][indexPath.row].name
        cell.descriptionTextLabel.text = cars[indexPath.section][indexPath.row].description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
        
    }
    
}
