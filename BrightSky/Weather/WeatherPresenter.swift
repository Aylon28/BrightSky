//
//  WeatherPresenter.swift
//  BrightSky
//
//  Created by Ilona Punya on 9.10.23.
//

import UIKit


protocol WeatherPresenterProtocol: AnyObject {
    var currentWeatherInformation: CurrentWeatherAndLocation { get }
    
    func getWeatherIcon() -> UIImage
    func getLocationName() -> String
    func getWeatherCondition() -> String
    func getTemperatureLabelInfo() -> String
    func getWindLabelInfo() -> String
    func getAdditionalInfo() -> String
}

class WeatherPresenter {
    weak var view: WeatherViewProtocol?
    var router: WeatherRouterProtocol
    var interactor: WeatherInteractorProtocol
    
    var currentWeatherInformation: CurrentWeatherAndLocation
    
    init(router: WeatherRouterProtocol, interactor: WeatherInteractorProtocol, weather: CurrentWeatherAndLocation) {
        self.router = router
        self.interactor = interactor
        self.currentWeatherInformation = weather
    }
}

extension WeatherPresenter: WeatherPresenterProtocol {
    
    func getWeatherIcon() -> UIImage {
        let imageName = currentWeatherInformation.current.condition.icon.components(separatedBy: "/")
        let imageNameStr = imageName.last?.components(separatedBy: ".")[0]
        return UIImage(named: imageNameStr ?? "113") ?? UIImage(systemName: "cloud")!
    }
    
    func getLocationName() -> String {
        return "\(currentWeatherInformation.location.name), \(currentWeatherInformation.location.country)"
    }
    
    func getWeatherCondition() -> String {
        return currentWeatherInformation.current.condition.text
    }
    
    func getTemperatureLabelInfo() -> String {
        return "Temperature: \(currentWeatherInformation.current.temp_c)°C\nFeels like: \(currentWeatherInformation.current.feelslike_c)°C"
    }
    
    func getWindLabelInfo() -> String {
        return "Wind direction: \(currentWeatherInformation.current.wind_dir)\nKph: \(currentWeatherInformation.current.wind_kph)"
    }
    
    func getAdditionalInfo() -> String {
        return "Humidity: \(currentWeatherInformation.current.humidity)%\nPressure: \(currentWeatherInformation.current.pressure_mb)mb\nUV: \(currentWeatherInformation.current.uv)\nVisibility: \(currentWeatherInformation.current.vis_km)km\nPrecipitation: \(currentWeatherInformation.current.precip_mm)mm"
    }
}
