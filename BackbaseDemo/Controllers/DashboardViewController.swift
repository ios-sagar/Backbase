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
        tbl_cityDetails.register(CityDetailsTableViewCell.nib(), forCellReuseIdentifier: "citydetails")
        tbl_cityDetails.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

extension DashboardViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "citydetails") as! CityDetailsTableViewCell
        cell.separatorInset = UIEdgeInsets.zero
        cell.selectionStyle = .none
        return cell
    }
}
