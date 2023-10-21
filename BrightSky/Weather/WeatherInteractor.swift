//
//  WeatherInteractor.swift
//  BrightSky
//
//  Created by Ilona Punya on 9.10.23.
//

import Foundation


protocol WeatherInteractorProtocol: AnyObject {
//    func loadLocation()
//    func loadWeather()
}

class WeatherInteractor {
    weak var presenter: WeatherPresenterProtocol?
//    let weatherService = WeatherService()
//    let locationService = LocationService()
}

extension WeatherInteractor: WeatherInteractorProtocol {
//    func loadLocation() {
//        locationService.getLocation { [weak self] location in
//            self?.presenter?.didLoad(location: location)
//        }
//    }
//
//    func loadWeather() {
//        weatherService.getWeather { [weak self] weather in
//            self?.presenter?.didLoad(weather: weather)
//        }
//    }
//
    
}
