//
//  WeatherViewController.swift
//  BrightSky
//
//  Created by Ilona Punya on 9.10.23.
//

import SnapKit
import UIKit

protocol WeatherViewProtocol: AnyObject {
//    func showLocation(_ location: String)
//    func showTemperature(_ temperature: String)
}

class WeatherViewController: UIViewController {
    var presenter: WeatherPresenterProtocol?
    
    private var weatherIconImage: UIImageView = {
        let uiImageView = UIImageView()
        uiImageView.contentMode = .scaleAspectFit
        return uiImageView
    }()
    
    private var weatherConditionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    private var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 2
        label.textColor = .black
        label.textAlignment = .center
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.cornerRadius = 15
        return label
    }()
    
    private var windLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 2
        label.textColor = .black
        label.textAlignment = .center
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.cornerRadius = 15
        return label
    }()
    
    private var additionalInfoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 5
        label.textColor = .black
        label.textAlignment = .center
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.cornerRadius = 15
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
        weatherIconImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            make.height.equalTo(64*2)
            make.width.equalTo(64*2)
        }
        
        weatherConditionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(weatherIconImage.snp.bottom).inset(-20)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX).dividedBy(2)
            make.centerY.equalTo(weatherConditionLabel.snp.bottom).inset(-70)
            make.width.equalToSuperview().dividedBy(2.1)
            make.height.equalTo(temperatureLabel.snp.width).dividedBy(2)
        }
        
        windLabel.snp.makeConstraints { make in
            make.leading.equalTo(temperatureLabel.snp.trailing).inset(-7)
            make.centerY.equalTo(weatherConditionLabel.snp.bottom).inset(-70)
            make.width.equalToSuperview().dividedBy(2.1)
            make.height.equalTo(temperatureLabel.snp.width).dividedBy(2)
        }
        
        additionalInfoLabel.snp.makeConstraints { make in
            make.centerY.equalTo(temperatureLabel.snp.bottom).inset(-70)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.03)
            make.height.equalTo(temperatureLabel.snp.width).dividedBy(1.5)
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .systemMint
        view.addSubview(weatherIconImage)
        view.addSubview(weatherConditionLabel)
        view.addSubview(temperatureLabel)
        view.addSubview(windLabel)
        view.addSubview(additionalInfoLabel)
        
        guard let presenter = presenter else { return }
        title = presenter.getLocationName()
        weatherIconImage.image = presenter.getWeatherIcon()
        weatherConditionLabel.text = presenter.getWeatherCondition()
        
        temperatureLabel.text = presenter.getTemperatureLabelInfo()
        windLabel.text = presenter.getWindLabelInfo()
        additionalInfoLabel.text = presenter.getAdditionalInfo()
    }

}

extension WeatherViewController: WeatherViewProtocol {
    
}
