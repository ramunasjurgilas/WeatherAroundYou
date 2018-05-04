//
//  ForecastHeaderView+extension.swift
//  WeatherAroundYou
//
//  Created by Ramunas Jurgilas on 2018-05-03.
//  Copyright © 2018 Ramūnas Jurgilas. All rights reserved.
//

import Foundation

extension ForecastHeaderView {
    func configureUsing(_ condition :Condition?, astronomy :Astronomy?, unit: UnitTemperature) {
        sunriseLabel.text = astronomy?.sunrise
        sunsetLabel.text = astronomy?.sunset
        textLabel.text = condition?.text
        temperatureLabel.text = condition?.localizedTemperatureUsing(unit)
    }
}
