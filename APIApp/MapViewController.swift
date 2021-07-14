//
//  MapViewController.swift
//  APIApp
//
//  Created by Vu Duy on 13/07/2021.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet var mapView:MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        setPin()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let allAnnotations = self.mapView.annotations
        self.mapView.removeAnnotations(allAnnotations)
    }
    
    func setPin(){
        // Set region
        let location = CLLocation(latitude: CLLocationDegrees(Coordinate.shareInstance.latitude), longitude: CLLocationDegrees(Coordinate.shareInstance.longitude))
        let regionRadius: CLLocationDistance = 10000.0
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(region, animated: true)
        mapView.delegate = self
        // Set pin
        let annontation = MKPointAnnotation()
        annontation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(Coordinate.shareInstance.latitude), longitude: CLLocationDegrees(Coordinate.shareInstance.longitude))
        mapView.addAnnotation(annontation)
    }

}

extension MapViewController:MKMapViewDelegate{
    
}
