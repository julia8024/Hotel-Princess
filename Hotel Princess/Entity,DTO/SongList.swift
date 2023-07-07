//
//  Song.swift
//  Hotel Princess
//
//  Created by 장세희 on 2023/06/03.
//

import Foundation

struct SongList: Codable, Identifiable {
    
    var songNumber: Int = 0
    var songString: String = "재생중인 곡이 없음"
    
    let id = UUID()
    
}

extension Encodable {
    
    var toDictionary : [Int: String]? {
        guard let object = try? JSONEncoder().encode(self) else { return nil }
        guard let dictionary = try? JSONSerialization.jsonObject(with: object, options: []) as? [Int:String] else { return nil }
        return dictionary
    }
}
