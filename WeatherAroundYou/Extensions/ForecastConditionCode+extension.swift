//
//  ForecastConditionCode+extension.swift
//  WeatherAroundYou
//
//  Created by Ramunas Jurgilas on 2018-05-03.
//  Copyright © 2018 Ramūnas Jurgilas. All rights reserved.
//

import UIKit

extension ForecastConditionCode {
    var forecastIcon: UIImage {
        get {
            switch self {
            case .tornado, .tropicalStorm, .hurricane:
                return #imageLiteral(resourceName: "icons8-tornado")
                
            case .severeThunderstorms, .thunderstorms, .isolatedThunderstorms, .scatteredThunderstorms, .scatteredThunderstorms2, .isolatedThundershowers, .thundershowers:
                return #imageLiteral(resourceName: "icons8-cloud_lighting")
                
            case .mixedRainAndSnow, .mixedRainAndSleet, .mixedSnowAndSleet, .sleet, .scatteredSnowShowers:
                return #imageLiteral(resourceName: "icons8-sleet")
                
                
            case .freezingDrizzle, .drizzle, .freezingRain, .mixedRainAndHail:
                return #imageLiteral(resourceName: "icons8-moderate_rain")
                
            case .showers, .showers2, .scatteredShowers:
                return #imageLiteral(resourceName: "icons8-light_rain")

            case .snowFlurries, .lightSnowShowers, .blowingSnow, .snow, .heavySnow, .heavySnow2, .snowShowers:
                return #imageLiteral(resourceName: "icons8-snow")

            case .hail:
                return #imageLiteral(resourceName: "icons8-hail")
                
            case .dust:
                return #imageLiteral(resourceName: "icons8-dust")
                
            case .haze, .foggy:
                return #imageLiteral(resourceName: "icons8-fog_day")
                
            case .cold, .windy, .blustery:
                return #imageLiteral(resourceName: "icons8-windy_weather")
                
            case .cloudy, .smoky:
                return #imageLiteral(resourceName: "icons8-clouds")
                
            case .partlyCloudyDay, .partlyCloudyNight, .mostlyCloudyDay, .mostlyCloudyNight, .partlyCloudy:
                return #imageLiteral(resourceName: "icons8-partly_cloudy_day")
                
            case .clearNight, .fairNight:
                return #imageLiteral(resourceName: "icons8-bright_moon")

            case .sunny, .fairDay, .hot:
                return #imageLiteral(resourceName: "icons8-summer")

            case .notAvailable:
                return #imageLiteral(resourceName: "icons8-question_mark")

            }
        }
    }
}
