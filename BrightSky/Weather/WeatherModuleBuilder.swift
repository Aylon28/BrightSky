//
//  WeatherModuleBuilder.swift
//  BrightSky
//
//  Created by Ilona Punya on 9.10.23.
//

import UIKit

class WeatherModuleBuilder {
    static func build(weather: CurrentWeatherAndLocation) -> WeatherViewController {
        let interactor = WeatherInteractor()
        let router = WeatherRouter()
        let presenter = WeatherPresenter(router: router, interactor: interactor, weather: weather)
        let viewController = WeatherViewController()
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.view = viewController
        return viewController
    }
    
}
