//
//  WelcomeViewController.swift
//  BrightSky
//
//  Created by Ilona Punya on 27.09.23.
//

import SnapKit
import UIKit

protocol WelcomeViewProtocol: AnyObject {
    func showLocation(_ location: String)
    func showTemperature(_ temperature: String)
}

class WelcomeViewController: UIViewController {
    var presenter: WelcomePresenterProtocol?
    
    private var placeDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.text = "Your current place is"
        label.textColor = .white
        return label
    }()
    
    private var placeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .regular)
        return label
    }()
    
    private var travelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tap to travel ✈️", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.contentEdgeInsets = UIEdgeInsets(top: 7, left: 15, bottom: 7, right: 15)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        return button
    }()
    
    private var temperatureDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.text = "Current temperature is"
        label.textColor = .white
        return label
    }()
    
    private var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    private var getMoreInformationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get more information", for: .normal)
        button.backgroundColor = .black
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        presenter?.viewDidLoad()
        getMoreInformationButton.addTarget(self, action: #selector(moreInfoButtonTapped), for: .touchUpInside)
        travelButton.addTarget(self, action: #selector(travelButtonTapped), for: .touchUpInside)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        placeDescriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(100)
        }
        
        placeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(placeDescriptionLabel.snp.bottom).inset(-25)
        }
        
        travelButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(placeLabel.snp.bottom).inset(-30)
        }
        
        temperatureDescriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(travelButton.snp.bottom).inset(-100)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(temperatureDescriptionLabel.snp.bottom).inset(-50)
        }
        
        getMoreInformationButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(50)
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(placeDescriptionLabel)
        view.addSubview(placeLabel)
        view.addSubview(travelButton)
        view.addSubview(temperatureDescriptionLabel)
        view.addSubview(temperatureLabel)
        view.addSubview(getMoreInformationButton)
        view.backgroundColor = .systemBlue
    }
    
    @objc private func moreInfoButtonTapped() {
        presenter?.moreInfoButtonTapped()
    }
    
    @objc private func travelButtonTapped() {
        presenter?.travelButtonTapped()
    }

}

extension WelcomeViewController: WelcomeViewProtocol {
    func showLocation(_ location: String) {
        DispatchQueue.main.async { [weak self] in
            self?.placeLabel.text = location
        }
    }
    
    func showTemperature(_ temperature: String) {
        DispatchQueue.main.async { [weak self] in
            self?.temperatureLabel.text = temperature + "°C"
        }
    }
    
    
}
