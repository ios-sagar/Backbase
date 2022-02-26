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
    var longitude = 0.0, latitude : Double = 0.0
    var viewtitle : String?
    @IBOutlet weak var lbl_title: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbl_title.text = viewtitle
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
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        mkMapViewObj.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error - locationManager: \(error.localizedDescription)")
    }
}
