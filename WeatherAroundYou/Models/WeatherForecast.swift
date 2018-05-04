//
//  WeatherForecast.swift
//  WeatherAroundYou
//
//  Created by Ramunas Jurgilas on 2018-05-03.
//  Copyright © 2018 Ramūnas Jurgilas. All rights reserved.
//

import Foundation

struct WeatherForecast: Codable {
    let query: Query?
    
    func weatherLocation() -> String {
        let city = query?.results?.channel?.location?.city
        let country = query?.results?.channel?.location?.country
        return "\(city ?? "Unknonw"), \(country ?? "Unknonw")"
    }
}

struct Astronomy: Codable {
    let sunrise: String
    let sunset: String
}

struct Forecast: Codable, LocalizedTemperature {
    var temperature: Double? {
        get {
            if let lowDouble = Double(low),
                let highDouble = Double(high) {
                return (highDouble + lowDouble) / 2
            }
            return nil
        }
    }
    
    let code: ForecastConditionCode?
    let date: String
    let day: String
    let high: String
    let low: String
    let text: String
}

struct Query: Codable {
    let count: Int
    let results: Results?
}

struct Results: Codable {
    let channel: Channel?
}
struct Channel: Codable {
    let units: Units
    let astronomy: Astronomy?
    let item: Item?
    let location: Location?
}

struct Location: Codable {
    let city: String?
    let country: String?
    let region: String?
}

struct Item: Codable {
    let lat: String
    let long: String
    let condition: Condition
    let forecast: [Forecast]
}

struct Condition: Codable, LocalizedTemperature {
    var temperature: Double? { get { return temp } }
    
    let code: String
    let date: String
    let temp: Double
    let text: String
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let temperature = try values.decode(String.self, forKey: .temp)
        temp = Double(temperature) ?? 0
        code = try values.decode(String.self, forKey: .code)
        date = try values.decode(String.self, forKey: .date)
        text = try values.decode(String.self, forKey: .text)
    }
}

struct Units: Codable {
    let temperature: String
    
    func unitTemperature() -> UnitTemperature {
        return temperature == "F" ? .fahrenheit : .celsius
    }
}

protocol LocalizedTemperature {
    var temperature: Double? { get }
}

extension LocalizedTemperature {
    
    func localizedTemperatureUsing(_ unit: UnitTemperature) -> String? {
        guard let temperature = temperature else { return nil }
        
        var measurement = Measurement(value: temperature, unit: unit)
        
        measurement.convert(to: UserDefaults.temperatureUnit())

        let unit = measurement.unit == UnitTemperature.celsius ? "℃" : "℉"
        
        return "\(Int(measurement.value))\(unit)"
    }
}

