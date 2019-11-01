//
//  ExperiencesViewController.swift
//  Experiences
//
//  Created by William Chen on 11/1/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation



class ExperiencesViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var recordButton: UIBarButtonItem!
    let locationManager = CLLocationManager()
    var results = Results()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        // Do any additional setup after loading the view.
        case .authorizedWhenInUse:
            locationManager.requestLocation()
        default:
            break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let annotations = mapView.annotations.compactMap({ $0 as? () })
        mapView.addAnnotations(annotations)
    }
        func didUpdateLocation(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
            
        }
        
        func didFailWithError(_ manager: CLLocationManager, didFailWithError error: Error){
            NSLog("Location manager failed with error: \(error)")
        }
        
        func didChangeAuthorization(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
            guard status == .authorizedWhenInUse else {return}
            
            locationManager.requestLocation()
        }
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    @IBAction func recordButtonPressed(_ sender: UIBarButtonItem) {
        
    }
}
    

