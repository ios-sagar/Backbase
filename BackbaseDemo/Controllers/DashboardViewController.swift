//
//  ViewController.swift
//  BackbaseDemo
//
//  Created by Sagar Chavan on 22/02/22.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var tbl_cityDetails: UITableView!
    private let dashboardViewModel = DashboardViewModel()
    var cityData = [Cities]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerTableViewCell()
        dashboardViewModel.dashboardDelegate = self
        dashboardViewModel.loadCities()
    }
    
    func registerTableViewCell() {
        tbl_cityDetails.register(CityDetailsTableViewCell.nib(), forCellReuseIdentifier: Constants.cityCellIdentifier)
        tbl_cityDetails.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

extension DashboardViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cityCellIdentifier) as! CityDetailsTableViewCell
        cell.separatorInset = UIEdgeInsets.zero
        cell.selectionStyle = .none
        cell.configureCell(city: cityData, indexPath: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cityViewController = Router.getControllerWith(identifier: Views.cityMap.rawValue) as? CityMapViewController {
            cityViewController.longitude = self.cityData[indexPath.row].coord.lon
            cityViewController.latitude = self.cityData[indexPath.row].coord.lat
            cityViewController.viewtitle = self.cityData[indexPath.row].name
            self.navigationController?.pushViewController(cityViewController, animated: true)
        }
    }
}

extension DashboardViewController : DashboardViewDelegate{
    func getCityValues(cityValues: [Cities]) {
        cityData = cityValues
    }
}
