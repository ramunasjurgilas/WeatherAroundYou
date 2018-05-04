//
//  UserDefault+extensio.swift
//  WeatherAroundYou
//
//  Created by Ramunas Jurgilas on 2018-05-03.
//  Copyright © 2018 Ramūnas Jurgilas. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    static let kTemperatureUnit = "TemperatureUnit"
    
    class func temperatureUnit() -> UnitTemperature {
        if let data = UserDefaults.standard.value(forKey: UserDefaults.kTemperatureUnit) as? Data,
            let decodedData = NSKeyedUnarchiver.unarchiveObject(with: data),
            let unit = decodedData as? UnitTemperature {
            return unit
        }
        return .fahrenheit
    }

    class func setTemperatureUnit(_ value: UnitTemperature) {
        let data = NSKeyedArchiver.archivedData(withRootObject: value)
        UserDefaults.standard.setValue(data, forKey: UserDefaults.kTemperatureUnit)
    }
}
