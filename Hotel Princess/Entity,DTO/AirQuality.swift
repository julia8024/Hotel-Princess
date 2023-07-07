//
//  Gas.swift
//  Hotel Princess
//
//  Created by 장세희 on 2023/06/02.
//

import Foundation

struct AirQuality: Codable {
    var gasQuality: Bool
    var temperature: Double
    
    init() {
        // false : 공기 나쁨, true : 공기 좋음
        gasQuality = true
        temperature = 0.0
    }
}
