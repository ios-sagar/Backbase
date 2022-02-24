//
//  CityMapViewController.swift
//  BackbaseDemo
//
//  Created by Sagar Chavan on 23/02/22.
//

import UIKit
import MapKit
import CoreLocation


class CityMapViewController: UIViewController {
    
    @IBOutlet weak var mkMapViewObj: MKMapView!
    var locationManager:CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        determineGivenLocation()
    }
    
    func determineGivenLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
}

extension CityMapViewController : CLLocationManagerDelegate,MKMapViewDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            locationManager.stopUpdatingLocation()
            render(location)
        }
    }
    
    func render(_ location:CLLocation){
        let coordinates = CLLocationCoordinate2D(latitude: 52.374031, longitude: 4.88969)
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        mkMapViewObj.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error - locationManager: \(error.localizedDescription)")
    }
}
