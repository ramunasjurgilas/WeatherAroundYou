//
//  EmptyViewStatus.swift
//  WeatherAroundYou
//
//  Created by Ramunas Jurgilas on 2018-05-04.
//  Copyright © 2018 Ramūnas Jurgilas. All rights reserved.
//

import Foundation
import UIKit

enum EmptyViewStatus {
    case location
    case unknownLocation
    case error
}

extension EmptyViewStatus {
    var localizedTitle: String {
        get {
            switch self {
            case .location:
                return "We need your location to show current weather conditions"
                
            case .error:
                return "Weather API can not be reached."
                
            case .unknownLocation:
                return "No information for this location"
            }
        }
    }
    
    var localizedButtonTitle: String? {
        get {
            switch self {
            case .location:
                return "Allow permission"
                
            case .error:
                return "Try one more time"
                
            case .unknownLocation:
                return nil
            }
        }
    }

    var image: UIImage {
        get {
            switch self {
            case .location:
                return #imageLiteral(resourceName: "icons8-marker")
                
            case .error:
                return #imageLiteral(resourceName: "icons8-cancel")
                
            case .unknownLocation:
                return #imageLiteral(resourceName: "icons8-nothing_found")
            }
        }
    }
}
