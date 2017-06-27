//
//  BusinessCell.swift
//  Yelp
//
//  Created by Vader1359 on 6/25/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {
    @IBOutlet weak var businessImg: UIImageView! 
    @IBOutlet weak var businessLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var reviewImg: UIImageView!
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var business: Business! {
        didSet {
            businessImg.setImageWith(business.imageURL ?? NSURL (fileURLWithPath: "http://zabas.com/wp-content/uploads/2017/01/chef_placeholder.jpg") as URL, placeholderImage: #imageLiteral(resourceName: "splash_screen_logo"))
            businessLabel.text = business.name
            distanceLabel.text = business.distance
            reviewImg.setImageWith(business.ratingImageURL!)
            addressLabel.text = business.address
            categoryLabel.text = business.categories
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
