//
//  NavigationBuilder.swift
//  BrightSky
//
//  Created by Ilona Punya on 9.10.23.
//

import UIKit

class NavigationBuilder {
    static var navigationController = UINavigationController()
    
//    init(viewController: UIViewController) {
//        self.navigationController = UINavigationController(rootViewController: viewController)
//    }
    
    func build(rootViewController: UIViewController) {
        NavigationBuilder.navigationController = UINavigationController(rootViewController: rootViewController)
    }
}
