//
//  WelcomeModuleBuilder.swift
//  BrightSky
//
//  Created by Ilona Punya on 27.09.23.
//

import UIKit

class WelcomeModuleBuilder {
    static func build() -> WelcomeViewController {
        let interactor = WelcomeInteractor()
        let router = WelcomeRouter()
        let presenter = WelcomePresenter(router: router, interactor: interactor)
        let viewController = WelcomeViewController()
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.view = viewController
        return viewController
    }
    
}
