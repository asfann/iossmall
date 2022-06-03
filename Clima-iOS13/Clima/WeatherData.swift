//
//  WeatherData.swift
//  Clima
//
//  Created by Mac on 15/05/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
struct WeatherData: Codable{
    var name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable{
    let temp:Double
    
}


struct Weather: Codable{
    let id:Int
}
