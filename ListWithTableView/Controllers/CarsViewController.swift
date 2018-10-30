//
//  CarsViewController.swift
//  ListWithTableView
//
//  Created by Diego Lopes on 26/10/18.
//  Copyright © 2018 Diego Lopes. All rights reserved.
//

import UIKit

class CarsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    /// Sections to add in tableview
    var sections = ["Recommendeds", "Most Viewds", "All" ]
    /// Cars for each section
    var cars = [ CarsDatasource.getCars(from: "Recommendeds"),
                 CarsDatasource.getCars(from: "Most Viewds"),
                 CarsDatasource.getCars(from: "All") ]
    
    /// Cars filtereds by search bar string
    var filteredCars = [[Car]]()
    
    /// Search controller
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
        setupTableViewHeader()
    }

    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Cars"
        searchController.searchBar.sizeToFit()

        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
    
    private func setupTableViewHeader() {
        tableView.tableHeaderView = searchController.searchBar
    }
}

extension CarsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredCars[section].count
        }
        
        return cars[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath) as! CarsTableViewCell
        
        let car = isFiltering() ? filteredCars[indexPath.section][indexPath.row] : cars[indexPath.section][indexPath.row]

        cell.photoImageView.image = car.image
        cell.nameTextLabel.text = car.name
        cell.descriptionTextLabel.text = car.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
        
    }
    
}

extension CarsViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        
        filteredCars.removeAll()
        
        for section in cars {
            filteredCars.append(section.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            })
        }

        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
}

extension CarsViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
    
}
