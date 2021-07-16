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
    var lastIndex: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Current map missing pin
        if lastIndex < Coordinate.shareInstance.lastIndex{
            setPin()
        }
        
        if Coordinate.shareInstance.selectedCoordinate.isSelected{
            setRegion()
        }
    }
    
    func setPin(){
        // Loop in range (indexOfLastPin, indexOfCoordinates)
        for index in lastIndex...Coordinate.shareInstance.lastIndex - 1{
            // Set pin
            let annontation = MKPointAnnotation()
            annontation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(Coordinate.shareInstance.cordinates[index].latitude), longitude: CLLocationDegrees(Coordinate.shareInstance.cordinates[index].longitude))
            mapView.addAnnotation(annontation)
        }
        lastIndex = Coordinate.shareInstance.lastIndex
    }
    
    func setRegion(){
        // Set region
        let location = CLLocation(latitude: CLLocationDegrees(Coordinate.shareInstance.selectedCoordinate.latitude), longitude: CLLocationDegrees(Coordinate.shareInstance.selectedCoordinate.longitude))
        let regionRadius: CLLocationDistance = 10000.0
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(region, animated: true)
        mapView.delegate = self
        
        //Reset selectedCoordinate
        Coordinate.shareInstance.selectedCoordinate = (0.0, 0.0, false)
    }

}

extension MapViewController:MKMapViewDelegate{
    
}
