//
//  MusicView.swift
//  Hotel Princess
//
//  Created by 장세희 on 2023/05/30.
//

import SwiftUI

struct MusicView: View {
    
    @ObservedObject var roomController = RoomController()
    
    @Binding var isPresented: Bool
    
    @State var playingNow: String
    
//    @State var selectedSong: String
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
        self.playingNow = playingSong.songString
//        self.cafeController.getCafe()
//        self.menuController.getMenuList(cafeId: cafe.cafeId)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("곡 선택")
                    .padding(20)
                    .modifier(GreenTitle())
            }
            
//            VStack {
//
//                Text("현재 재생 중인 곡")
//                    .padding(20)
//                    .modifier(GreenText16())
//                HStack {
//                    Image(systemName: "music.note")
//                        .modifier(IconSetting())
//
//                    Text("\(self.playingNow)")
//                        .modifier(GreenText())
//
//                    Text("\(playingSong.songString)")
//                }
//                .padding(.bottom, 20)
//                .padding(.horizontal, 20)
//
//            }
//            .frame(maxWidth: .infinity)
//            .overlay(
//                ZStack {
//                    RoundedRectangle(cornerRadius: 16)
//                        .stroke(Color("GreenColor"), lineWidth: 2)
//                }
//            )
//            .padding(30)
            
            VStack {
                ForEach(roomController.songList) { songList in
                    MusicRow(songList: songList, playingNow: playingNow)
                }
            }
            
//            VStack{
//                List(self.roomController.songList) { songList in
//                    Text("\(songList.songString)")
//                        .modifier(GreenText16())
//                }
//                .listStyle(.plain)
//                .padding(.top, 0).ignoresSafeArea()
//                .padding(.bottom, 1)
//            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .navigationTitle("음악 리스트")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(leading: Button("취소"){
//            /*code*/
//
//        }, trailing: Button("확인") {
//            /*code*/
//
//        })
        .onAppear() {
            self.roomController.getSongList()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
              // 0.5초 후 실행될 부분
                print("Music - songList: \(roomController.songList)")
            }
            
        }
    }
}

struct MusicRow: View {
    
//    @Binding var selectedSong: String
    @ObservedObject var roomController = RoomController()
    @State var playingNow: String = "재생중인 곡이 없음"
    
    var song : SongList
    
    init(songList: SongList, playingNow: String) {
        self.song = songList
        self.playingNow = playingNow
//        self.cafeId = Int(cafeListDTO.cafeId) ?? 0
    }
    
    var body: some View {
        VStack {
            Button(action: {
                playingSong = self.song
                self.playingNow = playingSong.songString
                
                roomStatus.setAudioSong(audioSong: playingSong.songNumber)
                self.roomController.setRoomStatus(roomSt: roomStatus)
                print("\(roomStatus)")
                print("\(playingSong)")
                
            }) {
                playingSong.songNumber == song.songNumber ?
                Text("\(song.songString)").font(.custom("YUniverse-B", size: 16))
                    .foregroundColor(Color("GoldColor"))
                : Text("\(song.songString)").font(.custom("YUniverse-B", size: 16))
                    .foregroundColor(Color("GreenColor"))
            }
            .padding(10)
        }
        
    }
    
}
