//
//  ViewController.swift
//  BackbaseDemo
//
//  Created by Sagar Chavan on 22/02/22.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var tbl_cityDetails: UITableView!
    @IBOutlet weak var city_searchBar: UISearchBar!
    
    private let dashboardViewModel = DashboardViewModel()
    var cityData = [Cities]()
    var filterData = [Cities]()
    var offSet = 100
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerTableViewCell()
        dashboardViewModel.dashboardDelegate = self
        loadCityData(offSet: offSet)
    }
    
    func registerTableViewCell() {
        tbl_cityDetails.register(CityDetailsTableViewCell.nib(), forCellReuseIdentifier: Constants.cityCellIdentifier)
        tbl_cityDetails.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func loadCityData(offSet : Int){
        dashboardViewModel.loadCities(offSet: offSet)
        self.filterData = self.cityData
        DispatchQueue.main.async {
            self.tbl_cityDetails.reloadData()
        }
    }
    
    func showSpinner(){
        let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        spinner.startAnimating()
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tbl_cityDetails.bounds.width, height: CGFloat(44))
        self.tbl_cityDetails.tableFooterView = spinner
        self.tbl_cityDetails.tableFooterView?.isHidden = false
    }
    
}

extension DashboardViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cityCellIdentifier) as! CityDetailsTableViewCell
        cell.separatorInset = UIEdgeInsets.zero
        cell.selectionStyle = .none
        cell.configureCell(city: self.filterData, indexPath: indexPath.row)
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !self.cityData.isEmpty, indexPath.row + 1 == self.cityData.count {
            self.offSet += 100
            loadCityData(offSet: offSet)
            self.tbl_cityDetails.reloadData()
        }
    }
    
}

extension DashboardViewController : DashboardViewDelegate{
    func getCityValues(cityValues: [Cities]) {
        self.cityData = cityValues
    }
}

extension DashboardViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filterData = cityData
        } else {
            filterData = cityData.filter{$0.name.range(of: searchText, options: .caseInsensitive) != nil }
        }
        self.tbl_cityDetails.reloadData()
    }
}
