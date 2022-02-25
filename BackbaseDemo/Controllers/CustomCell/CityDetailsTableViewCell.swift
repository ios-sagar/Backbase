//
//  CityDetailsTableViewCell.swift
//  BackbaseDemo
//
//  Created by Sagar Chavan on 23/02/22.
//

import UIKit

class CityDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_cityTitle: UILabel!
    @IBOutlet weak var lbl_coordinates: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib{
        return UINib(nibName: Constants.cityDetailsTableViewCell, bundle: nil)
    }
    
    func configureCell(city:[Cities], indexPath:Int){
        lbl_cityTitle.text = city[indexPath].name + " " + city[indexPath].country
        lbl_coordinates.text = String(city[indexPath].coord.lat)  + " " +  String(city[indexPath].coord.lon)
    }
    
}
