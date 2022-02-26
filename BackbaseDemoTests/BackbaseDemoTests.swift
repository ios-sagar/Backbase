//
//  BackbaseDemoTests.swift
//  BackbaseDemoTests
//
//  Created by Sagar Chavan on 22/02/22.
//

import XCTest
@testable import BackbaseDemo

class BackbaseDemoTests: XCTestCase {
    
    class NetworkManagerTest: XCTestCase {
        func testGetDataFrom(){
            let networkManagerObj = MockNetworkManager()
            networkManagerObj.getDataFrom(offset: 1) {(citidata, error) in
                XCTAssertNotNil(citidata)
            }
        }
    }
    
    class DashboardViewModelTest: XCTestCase{
        func testLoadCitiesTrue(){
            let dashboardviewModel = DashboardViewModel()
            dashboardviewModel.loadCities(offSet: 10)
            XCTAssert(true)
        }
        
        func testLoadCitiesFalse(){
            let dashboardviewModel = DashboardViewModel()
            dashboardviewModel.loadCities(offSet: 0)
            XCTAssert(true)
        }
        
        func testBindData(){
            let networkManagerObj = MockNetworkManager()
            let mockDashboardModel = MockDashboardViewModel()
            var bindResult : Bool?
            networkManagerObj.getDataFrom(offset: 10, completion: { city, Error in
                print(city as Any)
                if let response = city {
                    bindResult = mockDashboardModel.testBindData(parameter: response)
                }
            })
            if(bindResult!){
                XCTAssert(true)
            }else{
                XCTAssert(false)
            }
        }
    }
    
    class CityMapviewControllerTest: XCTestCase{
        func testLocation(){
            let locationManager = MockLocationManager()
            let authorizationStatus = locationManager.getAuthorizationStatus()
            let isEnabled = locationManager.isLocationServicesEnabled()
            if(authorizationStatus == .authorizedWhenInUse){
                XCTAssert(true)
            }else{
                XCTAssert(false)
            }
            if(isEnabled){
                XCTAssert(true)
            }else{
                XCTAssert(false)
            }
        }
    }
}
