//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Vader1359 on 6/25/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit

protocol FiltersViewControllerDelegate {
    func filtersViewController(filterVC: FiltersViewController, didUpdateCategories categories: [String], didUpdateDeal: Bool, didUpdateDistance: NSNumber, didUpdateMode: YelpSortMode)
}


class FiltersViewController: UIViewController {
    // List of Outlets
    
    @IBOutlet weak var switchDeal: UISwitch!
    
    @IBOutlet weak var distanceSegment: UISegmentedControl!
    
    @IBOutlet weak var modeSegment: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    // List of Actions
    
    @IBAction func switchDeal(_ sender: UISwitch) {
        self.hasDeal = sender.isOn
    }
    @IBAction func distanceIndexChanged(_ sender: UISegmentedControl) {
        switch distanceSegment.selectedSegmentIndex {
        case 0:
            self.selectedDistance = 0.1
        case 1:
            self.selectedDistance = 0.3
        case 2:
            self.selectedDistance = 1
        case 3:
            self.selectedDistance = 5
        default:
            self.selectedDistance = 0.0
        }
    }
    
    @IBAction func modeIndexChanged(_ sender: UISegmentedControl) {
        switch modeSegment.selectedSegmentIndex {
        case 0:
            self.selectedSortMode = YelpSortMode.bestMatched
        case 1:
            self.selectedSortMode = YelpSortMode.distance
        case 3:
            self.selectedSortMode = YelpSortMode.highestRated
        default:
            self.selectedSortMode = YelpSortMode.bestMatched
        }
    }
    
    
    @IBAction func onCancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSave(_ sender: Any) {
        // TODO: update filter and send back to 1st VC
        var selectedCategories = [String]()
        for (row, isSelected) in switchStates {
            if isSelected {
                selectedCategories.append(categories[row]["code"]!)
            }
        }
        
//        self.selectedFilters.append(self.hasDeal)
//        self.selectedFilters.append(self.selectedDistance)
//        self.selectedFilters.append(self.selectedSortMode)
//        self.selectedFilters.append(selectedCategories)
        
        
        
           delegate.filtersViewController(filterVC: self, didUpdateCategories: selectedCategories, didUpdateDeal: self.hasDeal, didUpdateDistance: self.selectedDistance, didUpdateMode: self.selectedSortMode)
        
        
        dismiss(animated: true, completion: nil)
        
    }
    
    // List of global variables
    
    var selectedFilters: [Any]!
    
    var hasDeal: Bool! = false
    var selectedDistance: NSNumber! = 0.0
    var selectedSortMode: YelpSortMode! = YelpSortMode.bestMatched
    
    var delegate: FiltersViewControllerDelegate!
    let categories: [[String: String]] =
        [["name" : "Afghan", "code": "afghani"],
         ["name" : "African", "code": "african"],
         ["name" : "American, New", "code": "newamerican"]]
    
    
    var switchStates = [Int: Bool] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchDeal.isOn = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension FiltersViewController: UITableViewDelegate, UITableViewDataSource, SwitchCellDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell") as! SwitchCell
        
        cell.categoryLabel.text = categories[indexPath.row]["name"]
        cell.switchBtn.isOn = switchStates[indexPath.row] ?? false
        cell.delegate = self
        
        return cell
    }
    
    func switchCell(switchCell: SwitchCell, didChangeValue value: Bool) {
        print("I get the update from the switch cell")
        let ip = tableView.indexPath(for: switchCell)
        
        switchStates[(ip?.row)!] = value
        
    }
    
    
}
