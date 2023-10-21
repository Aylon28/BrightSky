//
//  LocationService.swift
//  BrightSky
//
//  Created by Ilona Punya on 2.10.23.
//

import Foundation

class LocationService {
    public func getLocation(completion: @escaping (String) -> ()) {
        completion("Oslo")
    }
}
