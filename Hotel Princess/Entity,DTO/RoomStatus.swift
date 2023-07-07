//
//  RoomStatus.swift
//  Hotel Princess
//
//  Created by 장세희 on 2023/05/31.
//

import Foundation

struct RoomStatus: Codable {
    var roomNumber: Int = 2
    var airPurifierPower: Bool = true
    var deskLedPower: Bool = true
    var ceilingLedColor: String = "0,0,255"
    var ceilingLedPower: Bool = true
    // 열림 : true, 닫힘 : false
    var safeboxOpen: Bool = false
    var audioSong: Int = 0
    
    mutating func setRoomNumber(roomNumber: Int) {
        self.roomNumber = roomNumber
    }
    
    mutating func setAirPurifierPower(airPurifierPower: Bool) {
        self.airPurifierPower = airPurifierPower
    }
    
    mutating func setDeskLedPower(deskLedPower: Bool) {
        self.deskLedPower = deskLedPower
    }
    
    mutating func setCeilingLedColor(ceilingLedColor: String) {
        self.ceilingLedColor = ceilingLedColor
    }
    
    mutating func setCeilingLedPower(ceilingLedPower: Bool) {
        self.ceilingLedPower = ceilingLedPower
    }
    
    mutating func setSafeboxOpen(safeboxOpen: Bool) {
        self.safeboxOpen = safeboxOpen
    }
    
    mutating func setAudioSong(audioSong: Int) {
        self.audioSong = audioSong
    }
}
