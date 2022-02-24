//
//  ViewController.swift
//  BackbaseDemo
//
//  Created by Sagar Chavan on 22/02/22.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var tbl_cityDetails: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerTableViewCell()
    }
    
    func registerTableViewCell() {
        tbl_cityDetails.register(CityDetailsTableViewCell.nib(), forCellReuseIdentifier: Constants.cityCellIdentifier)
        tbl_cityDetails.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

extension DashboardViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cityCellIdentifier) as! CityDetailsTableViewCell
        cell.separatorInset = UIEdgeInsets.zero
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cityViewController = Router.getControllerWith(identifier: Views.cityMap.rawValue) as? CityMapViewController {
            self.navigationController?.pushViewController(cityViewController, animated: true)
        }
    }
}
