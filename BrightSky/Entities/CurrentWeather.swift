//
//  CurrentWeather.swift
//  BrightSky
//
//  Created by Ilona Punya on 9.10.23.
//

import Foundation

struct CurrentWeatherAndLocation: Codable {
    let current: CurrentWeather
    let location: Location
}

struct CurrentWeather: Codable {
    let cloud: Int
    let condition: Condition
    let feelslike_c: Double
    let gust_kph: Double
    let humidity: Int
    let precip_mm: Int
    let pressure_mb: Int
    let temp_c: Int
    let uv: Int
    let vis_km: Int
    let wind_dir: String
    let wind_kph: Double
}

struct Condition: Codable {
    let icon: String
    let text: String
}

struct Location: Codable {
    let country: String
    let name: String
}
