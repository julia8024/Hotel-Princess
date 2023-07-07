//
//  Guest.swift
//  Hotel Princess
//
//  Created by 장세희 on 2023/06/01.
//

import Foundation

struct Guest: Codable {
    var roomNumber: Int
    var guestName: String
    var phoneNumber: String
    
    init() {
        roomNumber = 0
        guestName = ""
        phoneNumber = ""
    }
}
