//
//  WelcomePresenter.swift
//  BrightSky
//
//  Created by Ilona Punya on 27.09.23.
//

import Foundation

protocol WelcomePresenterProtocol: AnyObject {
    func viewDidLoad()
    func didLoad(location: String?)
    func didLoad(weather: CurrentWeatherAndLocation?)
    
    func moreInfoButtonTapped()
    func travelButtonTapped()
}

class WelcomePresenter {
    weak var view: WelcomeViewProtocol?
    var router: WelcomeRouterProtocol
    var interactor: WelcomeInteractorProtocol
    
    var currentWeatherInformation: CurrentWeatherAndLocation?
    
    init(router: WelcomeRouterProtocol, interactor: WelcomeInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

extension WelcomePresenter: WelcomePresenterProtocol {
    func travelButtonTapped() {
        interactor.changeCity()
    }
    
    func moreInfoButtonTapped() {
        guard let weather = currentWeatherInformation else { return }
        router.goToMoreInformationScreen(weather: weather)
    }
    
    func viewDidLoad() {
        //interactor.loadLocation()
        interactor.loadWeather()
    }
    
    func didLoad(location: String?) {
        view?.showLocation(location ?? "No location detected")
    }
    
    func didLoad(weather: CurrentWeatherAndLocation?) {
        currentWeatherInformation = weather
        view?.showTemperature(String(weather?.current.temp_c ?? 404))
        view?.showLocation(weather?.location.name ?? "No place")
    }
}
