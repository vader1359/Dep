//
//  DistanceCell.swift
//  Yelp
//
//  Created by Vader1359 on 6/26/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit

class DistanceCell: UITableViewCell {
    @IBOutlet weak var distanceLabel: UIView!
    @IBOutlet weak var checkImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
