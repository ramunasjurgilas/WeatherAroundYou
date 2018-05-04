//
//  ForecastConditionCode.swift
//  WeatherAroundYou
//
//  Created by Ramunas Jurgilas on 2018-05-03.
//  Copyright © 2018 Ramūnas Jurgilas. All rights reserved.
//

import Foundation

enum ForecastConditionCode: String, Codable {
    case tornado                        = "0"
    case tropicalStorm                  = "1"
    case hurricane                      = "2"
    case severeThunderstorms           = "3"
    case thunderstorms                  = "4"
    case mixedRainAndSnow            = "5"
    case mixedRainAndSleet           = "6"
    case mixedSnowAndSleet           = "7"
    case freezingDrizzle               = "8"
    case drizzle                        = "9"
    case freezingRain                 = "10"
    case showers                       = "11"
    case showers2                       = "12"
    case snowFlurries                 = "13"
    case lightSnowShowers            = "14"
    case blowingSnow                  = "15"
    case snow                          = "16"
    case hail                          = "17"
    case sleet                         = "18"
    case dust                          = "19"
    case foggy                         = "20"
    case haze                          = "21"
    case smoky                         = "22"
    case blustery                      = "23"
    case windy                         = "24"
    case cold                          = "25"
    case cloudy                        = "26"
    case mostlyCloudyNight         = "27"
    case mostlyCloudyDay          = "28"
    case partlyCloudyNight         = "29"
    case partlyCloudyDay           = "30"
    case clearNight                 = "31"
    case sunny                         = "32"
    case fairNight                  = "33"
    case fairDay                    = "34"
    case mixedRainAndHail           = "35"
    case hot                           = "36"
    case isolatedThunderstorms        = "37"
    case scatteredThunderstorms       = "38"
    case scatteredThunderstorms2       = "39"
    case scatteredShowers             = "40"
    case heavySnow                    = "41"
    case scatteredSnowShowers        = "42"
    case heavySnow2                    = "43"
    case partlyCloudy                 = "44"
    case thundershowers                = "45"
    case snowShowers                  = "46"
    case isolatedThundershowers       = "47"
    case notAvailable               = "3200"
}
