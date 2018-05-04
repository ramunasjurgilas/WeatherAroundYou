//
//  YahooWeatherRequest.swift
//  WeatherAroundYou
//
//  Created by Ramunas Jurgilas on 2018-05-03.
//  Copyright © 2018 Ramūnas Jurgilas. All rights reserved.
//

import UIKit

class YahooWeatherRequest: BaseNetworking {
    
    init(location: String) {
        super.init()
        apiEndPoint = .yahooForecast(location: location)
    }
}
