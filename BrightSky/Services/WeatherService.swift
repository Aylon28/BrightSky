//
//  WeatherService.swift
//  BrightSky
//
//  Created by Ilona Punya on 27.09.23.
//

import Alamofire
import Foundation

class WeatherService {
    struct RequestInfo {
        static let apiBase = "https://api.weatherapi.com/v1"
        static let current = apiBase + "/current.json"
        static let apiKey = "b016240d1e364f7eb02123642230210"
        
        static var parameters = ["key": "b016240d1e364f7eb02123642230210",
                                 "q": "Oslo"]
    }
    
    public func changeCity(completion: @escaping (CurrentWeatherAndLocation) -> ()) {
        RequestInfo.parameters["q"] = popularCapitals.randomElement()
        getWeatherInfo { weather in
            completion(weather)
        }
    }
    
    public func getWeatherInfo(completion: @escaping (CurrentWeatherAndLocation) -> ()) {
        AF.request(RequestInfo.current, parameters: RequestInfo.parameters)
          .responseDecodable(of: CurrentWeatherAndLocation.self) { response in
            switch response.result {
            case let .success(weather):
                completion(weather)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    let allCapitals = ["Kabul", "Tirana", "Algiers", "Andorra la Vella", "Luanda", "St. John’s", "Buenos Aires", "Yerevan", "Canberra", "Vienna", "Baku", "Nassau", "Manama", "Dhaka", "Bridgetown", "Minsk", "Brussels", "Belmopan", "Porto-Novo", "Thimphu", "La Paz", "Sarajevo", "Gaborone", "Brasília", "Bandar Seri Begawan", "Sofia", "Ouagadougou", "Gitega", "Praia", "Phnom Penh", "Yaoundé", "Ottawa", "Bangui", "N’Djamena", "Santiago", "Beijing", "Bogotá", "Moroni", "Brazzaville", "San José", "Yamoussoukro", "Zagreb", "Havana", "Nicosia", "Prague", "Copenhagen", "Djibouti", "Roseau", "Santo Domingo", "Kinshasa", "Quito", "Cairo", "San Salvador", "Malabo", "Asmara", "Tallinn", "Mbabane", "Addis Ababa", "Suva", "Helsinki", "Paris", "Libreville", "Banjul", "Tbilisi", "Berlin", "Accra", "Athens", "St. George’s", "Guatemala City", "Conakry", "Bissau", "Georgetown", "Port-au-Prince", "Vatican City", "Tegucigalpa", "Budapest", "Reykjavik", "New Delhi", "Jakarta", "Tehran", "Baghdad", "Dublin", "Jerusalem", "Rome", "Kingston", "Tokyo", "Amman", "Nur-Sultan", "Nairobi", "South Tarawa", "Kuwait City", "Bishkek", "Vientiane", "Riga", "Beirut", "Maseru", "Monrovia", "Tripoli", "Vaduz", "Vilnius", "Luxembourg City", "Antananarivo", "Lilongwe", "Kuala Lumpur", "Male", "Bamako", "Valletta", "Majuro", "Nouakchott", "Port Louis", "Mexico City", "Palikir", "Chisinau", "Monaco", "Ulaanbaatar", "Podgorica", "Rabat", "Maputo", "Naypyidaw", "Windhoek", "Yaren District", "Kathmandu", "Amsterdam", "Wellington", "Managua", "Niamey", "Abuja", "Pyongyang", "Skopje", "Oslo", "Muscat", "Islamabad", "Ngerulmud", "Panama City", "Port Moresby", "Asunción", "Lima", "Manila", "Warsaw", "Lisbon", "Doha", "Bucharest", "Moscow", "Kigali", "Basseterre", "Castries", "Apia", "San Marino", "São Tomé", "Riyadh", "Dakar", "Belgrade", "Victoria", "Freetown", "Singapore", "Bratislava", "Ljubljana", "Honiara", "Mogadishu", "Cape Town", "Seoul", "Juba", "Madrid", "Sri Jayawardenepura Kotte", "Kingstown", "Ramallah", "Khartoum", "Paramaribo", "Stockholm", "Bern", "Damascus", "Dushanbe", "Dodoma", "Bangkok", "Dili", "Lomé", "Nuku’alofa", "Port of Spain", "Tunis", "Ankara", "Ashgabat", "Funafuti", "Kampala", "Kyiv", "Abu Dhabi", "London", "Washington DC", "Montevideo", "Tashkent", "Port Vila", "Caracas", "Hanoi", "Sana’a", "Lusaka", "Harare"]
    
    let popularCapitals = ["Buenos Aires", "Yerevan", "Canberra", "Vienna", "Baku", "Minsk", "Brussels", "Sarajevo", "Brasília", "Sofia", "Ottawa", "Santiago", "Beijing", "Bogotá", "San José", "Zagreb", "Prague", "Copenhagen", "Tallinn", "Helsinki", "Paris", "Tbilisi", "Berlin", "Athens", "Vatican City", "Budapest", "Reykjavik", "New Delhi", "Jakarta", "Dublin", "Jerusalem", "Rome", "Kingston", "Tokyo", "Astana", "Kuwait City", "Bishkek", "Riga", "Beirut", "Vilnius", "Luxembourg City", "Antananarivo",  "Mexico City", "Monaco", "Ulaanbaatar", "Podgorica", "Kathmandu", "Amsterdam", "Wellington", "Pyongyang", "Skopje", "Oslo", "Asunción", "Lima", "Manila", "Warsaw", "Lisbon", "Doha", "Bucharest", "Moscow", "Belgrade", "Singapore", "Bratislava", "Ljubljana", "Mogadishu", "Cape Town", "Seoul", "Madrid", "Kingstown", "Stockholm", "Bern", "Dushanbe", "Bangkok", "Tunis", "Ankara", "Kyiv", "Abu Dhabi", "London", "Washington DC", "Tashkent", "Port Vila", "Caracas", "Hanoi"]
    
    //New Delhi
    //Riga
    //Berlin
    //Bangkok
    //London
    //Reykjavik
    //Bogota
}
