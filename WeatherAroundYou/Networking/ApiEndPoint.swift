//
//  ApiEndPoint.swift
//  WeatherAroundYou
//
//  Created by Ramunas Jurgilas on 2018-05-03.
//  Copyright © 2018 Ramūnas Jurgilas. All rights reserved.
//

import Foundation

enum ApiEndPoint {
  //  case googleTextSearch(query: String, region: String)// = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=%@&region=%@&key=%@"
  //  case googlePlaceDetail(placeId: String)
    
    case yahooForecast(location: String)
    
}
//https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22nome%2C%20ak%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys
extension ApiEndPoint {
    static let yahooWeatherApiUrlFormat = "https://query.yahooapis.com/v1/public/yql?q=select * from weather.forecast where woeid in (select woeid from geo.places(1) where text=\"%@\")&format=json&env=store://datatables.org/alltableswithkeys"
    
    func url() -> URL {
        switch self {
        case .yahooForecast(let location):
            let formatted = String(format: ApiEndPoint.yahooWeatherApiUrlFormat, location)
            let encodedUrl = formatted.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            return URL(string: encodedUrl!)!
        }
    }
}
