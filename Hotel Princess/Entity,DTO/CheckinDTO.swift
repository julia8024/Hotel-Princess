//
//  CheckinDTO.swift
//  Hotel Princess
//
//  Created by 장세희 on 2023/05/24.
//

import Foundation

struct CheckinDTO : Codable {
    
    var roomNumber: Int
    var phoneNumber: String
    
    init(roomNumber: Int, phoneNumber: String) {
        self.roomNumber = roomNumber
        self.phoneNumber = phoneNumber
    }
    
}

