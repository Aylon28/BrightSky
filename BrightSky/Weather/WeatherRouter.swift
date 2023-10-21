//
//  WeatherRouter.swift
//  BrightSky
//
//  Created by Ilona Punya on 9.10.23.
//

import Foundation

protocol WeatherRouterProtocol: AnyObject {
    func goToMoreInformationScreen(weather: CurrentWeatherAndLocation)
}

class WeatherRouter {
    weak var view: WeatherViewProtocol?
}

extension WeatherRouter: WeatherRouterProtocol {
    
    func goToMoreInformationScreen(weather: CurrentWeatherAndLocation) {
//        let nextVC = WeatherModuleBuilder.build(weather: weather)
//        NavigationBuilder.navigationController.pushViewController(nextVC, animated: true)
        //navigationController?.pushViewController(nextVC, animated: true)
    }
}
