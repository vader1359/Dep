//
//  SwitchCell.swift
//  Yelp
//
//  Created by Vader1359 on 6/25/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit

protocol SwitchCellDelegate {
    func switchCell(switchCell: SwitchCell, didChangeValue value: Bool)
}

class SwitchCell: UITableViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var switchBtn: UISwitch!
    
    
    
    var delegate: SwitchCellDelegate!
    

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func switchCell(_ sender: UISwitch) {
        print("changed to \(sender.isOn)")
        delegate.switchCell(switchCell: self, didChangeValue: sender.isOn)
    }
}
