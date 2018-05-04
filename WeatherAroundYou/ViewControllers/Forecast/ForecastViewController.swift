//
//  ForecastViewController.swift
//  WeatherAroundYou
//
//  Created by Ramunas Jurgilas on 2018-05-03.
//  Copyright © 2018 Ramūnas Jurgilas. All rights reserved.
//

import UIKit
import CoreLocation

class ForecastViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {

    @IBOutlet weak var temperatureUnitButton: UIBarButtonItem!
    @IBOutlet weak var forecastHeaderView: ForecastHeaderView!
    @IBOutlet var emptyViewController: EmptyViewController!
    
    var lastKnownLocation: String?
    var locationManager = CLLocationManager()
    
    var forecast: WeatherForecast?
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emptyViewController.delegate = self
        locationManager.delegate = self
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for Weather"
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        
        tableView.tableHeaderView?.isHidden = true
        tableView.tableFooterView?.isHidden = true

        if CLLocationManager.authorizationStatus() == .notDetermined {
            showEmptyViewWithState(.location)
        }
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecast?.query?.results?.channel?.item?.forecast.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastCell", for: indexPath)

        let forecast = self.forecast?.query?.results?.channel?.item?.forecast[indexPath.row]
        let unit: UnitTemperature = self.forecast?.query?.results?.channel?.units.unitTemperature() ?? .fahrenheit
        (cell as? ForecastCell)?.configureUsing(forecast, unit: unit)

        return cell
    }

    // MARK: - IBAction
    
    @IBAction func didClickLocateMe(_ sender: Any) {
        locationManager.startUpdatingLocation()
    }
    
    @IBAction func didClickChangeTemperatureUnite(_ sender: Any) {
        if UserDefaults.temperatureUnit() == UnitTemperature.celsius {
            UserDefaults.setTemperatureUnit(UnitTemperature.fahrenheit)
        }
        else {
            UserDefaults.setTemperatureUnit(UnitTemperature.celsius)
        }
        update()
    }
    
    // MARK: - Private
    
    func update() {
        if forecast != nil {
            tableView.tableHeaderView?.isHidden = false
            tableView.tableFooterView?.isHidden = false
        }
        let condition = forecast?.query?.results?.channel?.item?.condition
        let astronomy = forecast?.query?.results?.channel?.astronomy
        let unit = forecast?.query?.results?.channel?.units.unitTemperature() ?? .fahrenheit
        forecastHeaderView.configureUsing(condition, astronomy: astronomy, unit: unit)
        tableView.reloadData()
        title = forecast?.weatherLocation()
        let switchUnit = UserDefaults.temperatureUnit() != UnitTemperature.celsius ? "℃" : "℉"
        temperatureUnitButton.title = switchUnit
    }
    
    func showEmptyViewWithState(_ state: EmptyViewStatus) {
        emptyViewController.status = state
        tableView.backgroundView = emptyViewController.emptyView
        tableView.tableHeaderView?.isHidden = true
        tableView.tableFooterView?.isHidden = true
        tableView.reloadData()
       // tableView.isScrollEnabled = false
    }
    
    func makeSearchUsing(_ location: String) {
        lastKnownLocation = location
        YahooWeatherRequest(location: location).execute(WeatherForecast.self) { (result, error) in
            if error != nil || (result?.query?.count ?? 0) == 0 {
                self.forecast = nil
                self.title = location
                let state: EmptyViewStatus = error != nil ? .error : .unknownLocation
                self.showEmptyViewWithState(state)
                return
            }
            self.forecast = result
            self.update()
        }
    }
    
    // MARK: - UISearchResultsUpdating Delegate
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let location = searchBar.text {
            makeSearchUsing(location)
        }
        searchController.isActive = false        
    }
}

fileprivate extension ForecastCell {
    func configureUsing(_ forecast: Forecast?, unit: UnitTemperature) {
        dateLabel.text = forecast?.day
        iconImageView.image = forecast?.code?.forecastIcon
        forecastLabel.text = forecast?.text
        temperatureLabel.text = forecast?.localizedTemperatureUsing(unit)
    }
}
