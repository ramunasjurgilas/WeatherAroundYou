//
//  ForecastViewController+CLLocationManagerDelegate+extension.swift
//  WeatherAroundYou
//
//  Created by Ramunas Jurgilas on 2018-05-04.
//  Copyright © 2018 Ramūnas Jurgilas. All rights reserved.
//

import Foundation
import CoreLocation

extension ForecastViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(locations.first!) { (placemarks, error) in
            guard let placemark = placemarks?.first else {
                return
            }

            let location = "\(placemark.country ?? "") \(placemark.locality ?? "")"
            self.makeSearchUsing(location)
        }
    }

}
