//
//  Constants.swift
//  BackbaseDemo
//
//  Created by Sagar Chavan on 23/02/22.
//

import Foundation

struct Constants {
    static let storyboard = "Main"
    static let cityCellIdentifier = "cityCellIdentifier"
    static let cityDetailsTableViewCell = "CityDetailsTableViewCell"
}

enum Views: String {
  case dashboard = "DashboardViewController"
  case cityMap = "CityMapViewController"
}

enum ViewTitle: String {
  case dashboard = "Backbase"
  case map = "City Map"
}
