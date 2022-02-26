//
//  MockNetworkManager.swift
//  BackbaseDemoTests
//
//  Created by Sagar Chavan on 26/02/22.
//

import Foundation
import CoreLocation
import MapKit

@testable import BackbaseDemo

class MockNetworkManager : NetworkManager{
    override func getDataFrom(offset: Int, completion: @escaping ([Cities]?, Error?) -> Void) {
        completion(getSuccessData(), nil)
    }
    
    func getSuccessData() -> [Cities]{
        let cities = [Cities(country: "DE", name: "Lichtenrade", id: 2878044, coord: Coord(lon: 13.40637, lat: 52.398441)),
                      Cities(country: "RU", name: "Zavety Il’icha", id: 464176, coord: Coord(lon: 37.849998, lat: 56.049999)),
                      Cities(country: "IL", name: "Azriqam", id: 295582, coord: Coord(lon: 34.700001, lat: 31.75)),
                      Cities(country: "IN", name: "Ghūra", id: 1271231, coord: Coord(lon: 79.883331, lat: 24.766666))]
        return cities
    }
}

class MockDashboardViewModel : DashboardViewModel{
    func testBindData(parameter: Any?) -> Bool{
        if let data = parameter as? [Cities] {
            self.cities = data
            self.cities = self.cities.sorted(by: { $0.name < $1.name })
            return true
        }else{
            print("error")
            return false
        }
    }
}

class MockLocationManager: CLLocationManager {
    func getAuthorizationStatus() -> CLAuthorizationStatus {
        return .authorizedWhenInUse
    }
    
    func isLocationServicesEnabled() -> Bool {
        return true
    }
}
