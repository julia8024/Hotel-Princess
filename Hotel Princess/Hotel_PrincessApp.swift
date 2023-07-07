//
//  Hotel_PrincessApp.swift
//  Hotel Princess
//
//  Created by 장세희 on 2023/05/23.
//

import SwiftUI

var guest: Guest = Guest()
var roomStatus: RoomStatus = RoomStatus()
var playingSong: SongList = SongList()

let host: String = "http://172.20.10.3:8080"

@main
struct Hotel_PrincessApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
