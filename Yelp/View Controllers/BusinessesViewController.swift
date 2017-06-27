//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Chau Vo on 10/17/16.
//  Copyright © 2016 CoderSchool. All rights reserved.
//

import UIKit
 
class BusinessesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var businesses: [Business]!
    var searchActive: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the Searchbar
        let leftNavBarBtn = UIBarButtonItem(customView: searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarBtn
        
        
            
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        
        Business.search(with: "") { (businesses: [Business]?, error: Error?) in
            if let businesses = businesses {
                self.businesses = businesses
                
                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
                self.tableView.reloadData()
            }
        }
        
        // Example of Yelp search with more search options specified
        /*
         Business.search(with: "Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]?, error: Error?) in
         if let businesses = businesses {
         self.businesses = businesses
         
         for business in businesses {
         print(business.name!)
         print(business.address!)
         }
         }
         }
         */
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navController = segue.destination as! UINavigationController
        let filterVC = navController.viewControllers.first as! FiltersViewController
        filterVC.delegate = self
        
    }
    
}

extension BusinessesViewController: UITableViewDataSource, UITableViewDelegate, FiltersViewControllerDelegate, UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    searchActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        Business.search(with: "\(searchText)") { (businesses: [Business]?, error: Error?) in
            if let businesses = businesses {
                self.businesses = businesses
                
                for business in businesses {
                    
                    print(business.name!)
                    print(business.address!)
                }
                    
                self.tableView.reloadData()
            }
            
            if (businesses!.count == 0) {
                self.searchActive = false
            } else {
                self.searchActive = true
            }
            
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if businesses != nil {
            return businesses.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "businessCell") as! BusinessCell
            
            cell.business = businesses[indexPath.row]
            
            return cell
    }
    
    func filtersViewController(filterVC: FiltersViewController, didUpdateCategories categories: [String], didUpdateDeal: Bool, didUpdateDistance: NSNumber, didUpdateMode: YelpSortMode) {
        print (didUpdateDeal)
        print (didUpdateMode)
        print (didUpdateDistance)
        print(categories)
        
        Business.search(with: "", sort: didUpdateMode, categories: categories, deals: didUpdateDeal) { (businesses: [Business]?, error: Error?) in
            if let businesses = businesses {
                self.businesses = businesses
                
                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
                self.tableView.reloadData()
            }
            
        }
    }
}
