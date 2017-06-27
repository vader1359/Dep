//
//  DealCell.swift
//  Yelp
//
//  Created by Vader1359 on 6/26/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit

protocol DealCellDelegate {
    func dealCell(switchCell: DealCell, didChangeValue value: Bool)
}

class DealCell: UITableViewCell {
    
    var delegate: DealCellDelegate!
    
    @IBOutlet weak var dealLabel: UILabel!
    
    @IBAction func dealCell(_ sender: UISwitch) {
        print("changed to \(sender.isOn)")
        delegate.dealCell(switchCell: self, didChangeValue: sender.isOn)
    }
    
    @IBOutlet weak var dealSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    


}
