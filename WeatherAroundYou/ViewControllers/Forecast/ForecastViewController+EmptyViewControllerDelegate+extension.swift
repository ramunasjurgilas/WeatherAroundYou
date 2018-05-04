//
//  ForecastViewController+EmptyViewControllerDelegate+extension.swift
//  WeatherAroundYou
//
//  Created by Ramunas Jurgilas on 2018-05-04.
//  Copyright © 2018 Ramūnas Jurgilas. All rights reserved.
//

import Foundation
import CoreLocation

extension ForecastViewController: EmptyViewControllerDelegate {
    func askedForAllowLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func askedForRetry() {
        if let location = lastKnownLocation {
            makeSearchUsing(location)
        }
    }
}
