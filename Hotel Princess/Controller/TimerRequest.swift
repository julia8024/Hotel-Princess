//
//  TimerRequest.swift
//  Hotel Princess
//
//  Created by 장세희 on 2023/06/02.
//

import Foundation
import Alamofire
import Combine

class TimerRequest: ObservableObject {
    
    @Published var airQuality = AirQuality()
    
    @Published var value : Int = 0
    
//    init() {
    func getAirQuality(roomNumber: Int) {
//    init() {
//        var url = self.setURL()
        let url = host + "/room/state/air-quality/" + String(guest.roomNumber)
        
        print("guest.roomNumber : \(guest.roomNumber)")
        // URLRequest 객체 생성 (url 전달)
        var request = URLRequest(url: URL(string: url)!)
        // 메소드 지정
        request.httpMethod = "GET"
        // 헤더 정보 설정
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
            //            self.value += 1
            
            AF.request(request).responseDecodable(of:AirQuality.self) { response in
                switch response.result {
                case .success(let value):
                    print("호출 성공 airQuality")
                    self.airQuality = value
                    
                case .failure(_):
                    print(response.result)
                    print("호출 실패 airQuality")
                }
            }
            
        }
    }
    
//    func setURL() -> String {
//        return host + "/room/state/air-quality/" + String(guest.roomNumber)
//    }
    
}
