//
//  CityDetailsTableViewCell.swift
//  BackbaseDemo
//
//  Created by Sagar Chavan on 23/02/22.
//

import UIKit

class CityDetailsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "CityDetailsTableViewCell", bundle: nil)
    }
    
}
