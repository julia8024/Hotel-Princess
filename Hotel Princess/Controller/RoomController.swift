//
//  RoomController.swift
//  Hotel Princess
//
//  Created by 장세희 on 2023/05/23.
//

import Foundation
import Alamofire

class RoomController: ObservableObject {
    
    @Published var guestData = Guest()
    
    @Published var returnIsChkin = false
    @Published var returnIsPresented = true
    
    @Published var roomStatusData = RoomStatus()
    
    @Published var songList = [SongList]()
    
    // authentication
    func chkin(chkinDTO: CheckinDTO) {
        let url = host + "/authentication"
        
        // URLRequest 객체 생성 (url 전달)
        var request = URLRequest(url: URL(string: url)!)
        // 메소드 지정
        request.httpMethod = "POST"
        // 헤더 정보 설정
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // json 인코더 생성
        let encoder = JSONEncoder()
        
        // json 출력 시 예쁘게 출력
        encoder.outputFormatting = .prettyPrinted
        
        do {
            // json 객체로 변환
            let encodedData = try encoder.encode(chkinDTO)
            // Request Body에 json 추가
            request.httpBody = encodedData
            
        } catch {
            print("error")
        }
        
        AF.request(request).responseDecodable(of:Guest.self) { response in
            switch response.result {
            case .success(let value):
                print("check-in 성공")
                self.guestData = value
                guest = value
                
                self.returnIsChkin = true
                self.returnIsPresented = false
                
            case .failure(_):
                print(response.result)
                print("check-in 실패")
                self.returnIsChkin = false
                self.returnIsPresented = true
            }
        }
        
    }
    
    
    // 객실 상태 보기
    func getRoomStatus() {
        
        let url = host + "/room/state/" + String(guest.roomNumber)
        
        var request = URLRequest(url: URL(string: url)!)
        // 메소드 지정
        request.httpMethod = "GET"
        // 헤더 정보 설정
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        AF.request(request).responseDecodable(of:RoomStatus.self) { response in
            switch response.result {
            case .success(let value):
                print("호출 성공 getRoomStatus")
                self.roomStatusData = value
                roomStatus = value
                
            case .failure(_):
                print(response.result)
                print("호출 실패 getRoomStatus")
            }
        }
    }
    
    // 전체 기기 설정
    func setRoomStatus(roomSt: RoomStatus) {
        let url = host + "/room/control"
        
        // URLRequest 객체 생성 (url 전달)
        var request = URLRequest(url: URL(string: url)!)
        // 메소드 지정
        request.httpMethod = "POST"
        // 헤더 정보 설정
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // json 인코더 생성
        let encoder = JSONEncoder()
        
        // json 출력 시 예쁘게 출력
        encoder.outputFormatting = .prettyPrinted
        
        do {
            // json 객체로 변환
            let encodedData = try encoder.encode(roomSt)
            // Request Body에 json 추가
            request.httpBody = encodedData
        } catch {
            print("error")
        }
        
        AF.request(request).responseString { (response) in
            switch response.result {
            case .success:
                print("호출 성공 setRoomStatus")
                print("\(roomStatus.roomNumber)")
                roomStatus = roomSt
                
            case .failure(_):
                print("호출 실패 setRoomStatus")
            }
        }
        
    }
    
    func getSongList() {
        
        let url = host + "/song-list"
        
        // URLRequest 객체 생성 (url 전달)
        var request = URLRequest(url: URL(string: url)!)
        // 메소드 지정
        request.httpMethod = "GET"
        // 헤더 정보 설정
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        AF.request(request).responseDecodable(of: [SongList].self) { response in

            switch response.result {
            case .success(let value):
                print("호출 성공 getSongList")
                self.songList = value
                
            case .failure(_):
                print(response.result)
                print("호출 실패 getSongList")
            }
        }
    }
}
