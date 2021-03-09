//
//  LocationManager.swift
//  Reader
//
//  Created by Legolas on 2021-02-24.
//

import Foundation
import Combine
import CoreLocation
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 39.9055,
            longitude: 116.3976
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.005,
            longitudeDelta: 0.005
        )
    )
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.005,
                longitudeDelta: 0.005
            )
        )
    }
    
    func lookUpCurrentLocation(location: CLLocation, completionHandler: @escaping (CLPlacemark?)
                    -> Void ) {

            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location,
                        completionHandler: { (placemarks, error) in
                if error == nil {
                    let firstLocation = placemarks?[0]
                    completionHandler(firstLocation)
                }
            })
    }
}




















