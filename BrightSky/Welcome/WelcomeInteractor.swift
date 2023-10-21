//
//  WelcomeInteractor.swift
//  BrightSky
//
//  Created by Ilona Punya on 27.09.23.
//

import Foundation

protocol WelcomeInteractorProtocol: AnyObject {
    func loadWeather()
    func changeCity()
}

class WelcomeInteractor {
    weak var presenter: WelcomePresenterProtocol?
    let weatherService = WeatherService()
    let locationService = LocationService()
}

extension WelcomeInteractor: WelcomeInteractorProtocol {
    
    func loadWeather() {
        weatherService.getWeatherInfo { [weak self] weather in
            self?.presenter?.didLoad(weather: weather)
        }
    }
    
    func changeCity() {
        weatherService.changeCity { [weak self] weather in
            self?.presenter?.didLoad(weather: weather)
        }
    }
    
    
}
