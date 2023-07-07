//
//  MainView.swift
//  Hotel Princess
//
//  Created by 장세희 on 2023/05/23.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var roomController = RoomController()
    @ObservedObject var timerRequest = TimerRequest()
    
    @State private var showAlert: Bool = false
    
    @State private var showMusicView: Bool = false
    
    @State private var ceilingLED: Bool = true
    @State private var ceilingLEDColor: Color = Color.red
    
    @State private var deskLED: Bool = true
    
    @State private var airPurifier: Bool = true
    // true : 잠김 상태
    @State private var safeBox: Bool = true
    
    // airQuality 로딩 전 : false
    @State private var loading: Bool = false
    
    @State private var audioSong: Int = 0
    
//    @State private var songList: Dictionary<Int, String>
    
    init() {
//        self.roomController.getSongList()
        
        roomStatus.setRoomNumber(roomNumber: guest.roomNumber)
        print("init- guest.roomNumber: \(guest.roomNumber)")
        print("init- roomStatus.roomNumber: \(roomStatus.roomNumber)")
        
    }
    
    var body: some View {
        VStack {
// MARK: - 타이틀
            HStack {
                VStack(alignment: .leading) {
                    Text("HOTEL PRINCESS")
                        .font(.custom("CinzelDecorative-Bold", size: 20))
                        .foregroundColor(Color("GreenColor"))
                        .tracking(-0.5)
                        .padding(.bottom, 2)
                  
                    Text("Stay Comfortable in Our Hotel")
                        .modifier(GreenText14())
                }
                .frame(maxWidth: .infinity)
                    
                Spacer()
                
// MARK: - 사용자 정보
                Button {
                    // 클릭 시 사용자 정보창 띄우기
                    // 체크아웃 기능
                } label: {
                    HStack {
                        
                        Image("KeyIcon")
                            .resizable()
                            .aspectRatio(0.4, contentMode: .fit)
                            .clipped() //프레임을 벗어나는 이미지 제거
                            .frame(height: 40)
                            .padding(.leading, 6)
                            .padding(.vertical, 10)
                        
                        VStack(alignment: .trailing) {
                            
                            Text("\(guest.roomNumber)호실")
                                .modifier(GoldText18())
                            
                            Text("\(guest.guestName)님")
                                .font(.custom("YUniverse-L", size: 16))
                                .foregroundColor(Color("GoldColor"))
                        }
                        .padding(.trailing, 10)
                        .padding(.vertical, 10)
           
                    }
                    .background(Color("GreenColor"))
                    .cornerRadius(10)
                    
                }
                
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 30)
            .padding(.top, 30)
            .padding(.bottom, 10)
            
            
            ScrollView {

// MARK: - 온도 / 공기질 대시보드
                HStack {
                    VStack {
                        HStack {
                            Image(systemName: "thermometer")
                                .modifier(IconSetting())
                            Text("온도")
                                .modifier(GreenTitle())
                        }
                        .padding(.top, 20)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 4)
                        
                        Text("\(self.timerRequest.airQuality.temperature, specifier: "%.1f")℃")
                            .font(.custom("YUniverse-B", size: 36))
                            .foregroundColor(Color("GreenColor"))
                            .padding(.bottom, 20)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray, lineWidth: 2)
                        }
                    )
                    
                    Spacer(minLength: 10)
                    
                    VStack {
                        HStack {
                            Image(systemName: "drop.fill")
                                .modifier(IconSetting())
                            Text("공기질")
                                .modifier(GreenTitle())
                        }
                        .padding(.top, 20)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 4)
                        
                        self.timerRequest.airQuality.gasQuality ?
                        Image(systemName: "drop.circle.fill")
                            .environment(\.symbolVariants, .none)
                            .font(.system(size: 36))
                            .foregroundColor(Color(UIColor.systemBlue))
                            .padding(.bottom, 1)
                        : Image(systemName: "exclamationmark.triangle.fill")
                            .environment(\.symbolVariants, .none)
                            .font(.system(size: 36))
                            .foregroundColor(Color(UIColor.systemRed))
                            .padding(.bottom, 1)
                        
                        
                        self.timerRequest.airQuality.gasQuality ?
                        Text("공기 좋음")
                            .font(.custom("YUniverse-B", size: 20))
                            .foregroundColor(Color(UIColor.systemBlue))
                            .padding(.bottom, 20)
                        : Text("공기 나쁨!")
                            .font(.custom("YUniverse-B", size: 20))
                            .foregroundColor(Color(UIColor.systemRed))
                            .padding(.bottom, 20)
                        
                        
                        
                    }
                    .frame(maxWidth: .infinity)
                    .overlay(
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray, lineWidth: 2)
                        }
                    )

                }
                .padding(.top, 10)
                .padding(.bottom, 20)
                .padding(.horizontal, 30)
                
// MARK: - 노래
                Text("현재 재생 중인 곡")
                    .padding(.bottom, 2)
                    .padding(.leading, 46)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .modifier(GreenText16())
                    
                // 음악 선택
                Button {
                    showMusicView = true
                } label: {
                    HStack {
                        Image(systemName: "music.note")
                            .environment(\.symbolVariants, .none)
                            .font(.system(size: 16))
                            .foregroundColor(Color("GoldColor"))
                            .padding(.leading, 16)
                        
                        
                        Text("\(playingSong.songString)")
                            .padding(.vertical, 10)
                            .modifier(GoldText())
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .environment(\.symbolVariants, .none)
                            .font(.system(size: 16))
                            .foregroundColor(Color("GoldColor"))
                            .padding(.trailing, 16)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color("GreenColor"))
                    .cornerRadius(14)
                    .padding(.horizontal, 30)
                }
                .sheet(isPresented: $showMusicView) {
                    MusicView(
                        isPresented: $showMusicView)
                }
                .padding(.bottom, 20)
                
// MARK: - 천장 LED 제어
                VStack {
                    Text("천장등")
                        .modifier(GreenTitle())
                        .padding(.vertical, 20)
                    
                    HStack {
                        roomStatus.ceilingLedPower ? Text("조명 끄기").modifier(GreenText()) : Text("조명 켜기").modifier(GreenText())
                        Spacer()
                        Toggle("", isOn: $ceilingLED)
                            .onChange(of: ceilingLED) { value in
                                roomStatus.setCeilingLedPower(ceilingLedPower: ceilingLED)
                                self.roomController.setRoomStatus(roomSt: roomStatus)
                                print("\(roomStatus)")
                            }

                    }
                    .padding(.horizontal, 20)
                    
                    HStack {
                        Text("조명 색상").modifier(GreenText())
                            .padding(.bottom, 30)
                        ColorPicker("", selection: $ceilingLEDColor, supportsOpacity: false)
                            .padding(.bottom, 20)
                            .onChange(of: ceilingLEDColor) { value in
                                roomStatus.setCeilingLedColor(ceilingLedColor: getColorsFromPicker(pickerColor: ceilingLEDColor))
                                
                                self.roomController.setRoomStatus(roomSt: roomStatus)
                            }
                    }
                    .padding(.horizontal, 20)
                    
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color("GreenColor"), lineWidth: 2)
                )
                .padding(.horizontal, 30)
                .padding(.bottom, 20)
                
// MARK: - 무드등 / 공기청정기 / 금고
                HStack {
                    // 무드등
                    Button {
                        deskLED.toggle()
                        roomStatus.setDeskLedPower(deskLedPower: deskLED)
                        print("\(roomStatus)")
                        self.roomController.setRoomStatus(roomSt: roomStatus)
                    } label: {
                        VStack {
                            deskLED ? Text("무드등").font(.custom("YUniverse-B", size: 24)).foregroundColor(Color("GoldColor"))
                            : Text("무드등").font(.custom("YUniverse-B", size: 24)).foregroundColor(Color("GreenColor"))
                            
                            Spacer(minLength: 10)
                            
                            deskLED ? Image(systemName: "lightbulb.fill")
                                .environment(\.symbolVariants, .none)
                                .font(.system(size: 32))
                                .foregroundColor(Color("GoldColor"))
                            : Image(systemName: "lightbulb.slash")
                                .environment(\.symbolVariants, .none)
                                .font(.system(size: 32))
                                .foregroundColor(Color("GreenColor"))
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(20)
                        .overlay(
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color("GreenColor"), lineWidth: 2)
                            }
                        )
                        .background(deskLED ? Color("GreenColor") : .white)
                        .cornerRadius(16)
                    }
                    
                    Spacer(minLength: 10)
                    
                    // 공기청정기
                    Button {
                        self.airPurifier.toggle()
                        roomStatus.setAirPurifierPower(airPurifierPower: airPurifier)
                        print("\(roomStatus)")
                        self.roomController.setRoomStatus(roomSt: roomStatus)
                    } label: {
                        VStack {
                            self.airPurifier ? Text("공기청정기").font(.custom("YUniverse-B", size: 24)).foregroundColor(Color("GoldColor"))
                            : Text("공기청정기").font(.custom("YUniverse-B", size: 24)).foregroundColor(Color("GreenColor"))
                            
                            Spacer(minLength: 10)
                            
                            self.airPurifier ? Image(systemName: "wind.snow")
                                .environment(\.symbolVariants, .none)
                                .font(.system(size: 32))
                                .foregroundColor(Color("GoldColor"))
                            : Image(systemName: "wind.snow")
                                .environment(\.symbolVariants, .none)
                                .font(.system(size: 32))
                                .foregroundColor(Color("GreenColor"))
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(20)
                        .overlay(
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color("GreenColor"), lineWidth: 2)
                            }
                        )
                        .background(self.airPurifier ? Color("GreenColor") : .white)
                        .cornerRadius(16)
                    }
                    
                    Spacer(minLength: 10)
                    
                    // 금고
                    Button {
                        self.safeBox.toggle()
                        roomStatus.setSafeboxOpen(safeboxOpen: safeBox)
                        print("\(roomStatus)")
                        self.roomController.setRoomStatus(roomSt: roomStatus)
                    } label: {
                        VStack {
                                
                            self.safeBox ? Text("금고").font(.custom("YUniverse-B", size: 24)).foregroundColor(Color("GoldColor"))
                            : Text("금고").font(.custom("YUniverse-B", size: 24)).foregroundColor(Color("GreenColor"))
                            
                            Spacer(minLength: 10)
                            
                            self.safeBox ? Image(systemName: "lock.fill")
                                .environment(\.symbolVariants, .none)
                                .font(.system(size: 32))
                                .foregroundColor(Color("GoldColor"))
                            : Image(systemName: "lock.open.fill")
                                .environment(\.symbolVariants, .none)
                                .font(.system(size: 32))
                                .foregroundColor(Color("GreenColor"))
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(20)
                        .overlay(
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color("GreenColor"), lineWidth: 2)
                            }
                        )
                        .background(self.safeBox ? Color("GreenColor") : .white)
                        .cornerRadius(16)
                    }

                }
                .padding(.bottom, 30)
                .padding(.horizontal, 30)
                
                
            } // scrollview
            
            

        } // vstack
        .onAppear {
            roomStatus.setRoomNumber(roomNumber: guest.roomNumber)
            self.roomController.getRoomStatus()
            self.setStatusFromGetData()
            print("onAppear:\(roomStatus)")
            
            // airQuality
            if (loading == false && guest.roomNumber != 0) {
                self.timerRequest.getAirQuality(roomNumber: guest.roomNumber)
                loading.toggle()
                print("if문 - Appear")
            }
            
            self.roomController.getSongList()
            print("songList: \(roomController.songList)")
//            songList = self.roomController.songList.toDictionary

        }
        .refreshable {
            showAlert = true
            if (loading == false && guest.roomNumber != 0) {
                self.timerRequest.getAirQuality(roomNumber: guest.roomNumber)
                loading.toggle()
                print("if문 - refreshable")
            }
            
            self.roomController.getRoomStatus()
            self.setStatusFromGetData()
            
            self.roomController.getSongList()
            print("Main - songList: \(roomController.songList)")
            
        }
    }
    
    func setStatusFromGetData() {
        self.airPurifier = roomStatus.airPurifierPower
        self.deskLED = roomStatus.deskLedPower
        self.ceilingLED = roomStatus.ceilingLedPower
        self.safeBox = roomStatus.safeboxOpen
        self.audioSong = roomStatus.audioSong
        
        var colorArr = roomStatus.ceilingLedColor.split(separator:",")
        self.ceilingLEDColor = Color(UIColor(red: CGFloat((colorArr[0] as NSString).floatValue),
                             green: CGFloat((colorArr[1] as NSString).floatValue),
                              blue: CGFloat((colorArr[2] as NSString).floatValue),
                             alpha: 1))
        
        
    }
    
    // Color -> String
    func getColorsFromPicker(pickerColor: Color) -> String {
        let colorString = "\(pickerColor)"
        let colorArray: [String] = colorString.components(separatedBy: " ")
        var strColor: String = ""
        
        if colorArray.count > 1 {
            var r: Int = Int(Float((Float(colorArray[1]) ?? 1)) * 255)
            var g: Int = Int(Float((Float(colorArray[2]) ?? 1)) * 255)
            var b: Int = Int(Float((Float(colorArray[3]) ?? 1)) * 255)
            
            if (r < 0) {r = 0}
            if (g < 0) {g = 0}
            if (b < 0) {b = 0}
            
            if (r > 255) {r = 255}
            if (g > 255) {g = 255}
            if (b > 255) {b = 255}
            
            // Update UIColor
//            return UIColor(red: r, green: g, blue: b, alpha: alpha)
            strColor = String(r) + "," + String(g) + "," + String(b)
        }
        return strColor
    }
    
}
