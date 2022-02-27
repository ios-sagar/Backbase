//
//  DashboardViewModel.swift
//  BackbaseDemo
//
//  Created by Sagar Chavan on 25/02/22.
//

import Foundation

protocol DashboardViewDelegate{
    func getCityValues(cityValues : [Cities])
}

struct Cities: Codable {
    let country, name: String
    let id: Int
    let coord: Coord

    enum CodingKeys: String, CodingKey {
        case country, name
        case id = "_id"
        case coord
    }
}

struct Coord: Codable {
    let lon, lat: Double
}

class DashboardViewModel{
    
    var cities = [Cities]()
    var dashboardDelegate : DashboardViewDelegate?
    var networkManager = NetworkManager()
    
    func loadCities(offSet : Int) {
        networkManager.getDataFrom(offset: offSet, completion: { city, Error in
            if let response = city {
                self.bindData(parameter: response)
            }
        })
    }
    
    func bindData(parameter: Any?) {
        if let data = parameter as? [Cities] {
            self.cities = data
            self.cities = self.cities.sorted(by: { $0.name < $1.name })
            dashboardDelegate?.getCityValues(cityValues: self.cities)
        }else{
            print("error")
        }
    }
    
    func showFilteredData(searchTextValue : String) -> [Cities]{
        return cities.filter{$0.name.range(of: searchTextValue, options: .caseInsensitive) != nil }
    }
}
