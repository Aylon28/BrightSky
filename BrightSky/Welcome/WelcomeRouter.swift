//
//  WelcomeRouter.swift
//  BrightSky
//
//  Created by Ilona Punya on 27.09.23.
//

import UIKit

protocol WelcomeRouterProtocol: AnyObject {
    func goToMoreInformationScreen(weather: CurrentWeatherAndLocation)
}

class WelcomeRouter {
    weak var view: WelcomeViewProtocol?
}

extension WelcomeRouter: WelcomeRouterProtocol {
    
    func goToMoreInformationScreen(weather: CurrentWeatherAndLocation) {
        let nextVC = WeatherModuleBuilder.build(weather: weather)
        NavigationBuilder.navigationController.pushViewController(nextVC, animated: true)
        //navigationController?.pushViewController(nextVC, animated: true)
    }
}
