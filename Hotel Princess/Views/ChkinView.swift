//
//  ChkinView.swift
//  Hotel Princess
//
//  Created by 장세희 on 2023/05/23.
//

import SwiftUI

struct ChkinView: View {
    
    @ObservedObject var roomController = RoomController()
    
    @State private var inputRoomNum: String
    @State private var inputPhoneNum: String
    
    @State private var wrongInput = false
    
    @Binding var isPresented: Bool
    @Binding var isChkin: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle().frame(height:0)
            Text("체크인").font(.custom("YUniverse-B", size: 24)).fontWeight(.black).foregroundColor(Color("GreenColor"))
            Spacer().frame(height:70)
            VStack(alignment: .leading) {
                
                UnderlineTextFieldView(text: $inputRoomNum, textField: roomView, placeholder: "호실 번호를 입력하세요")
                    .padding(.bottom, 32)
                
                UnderlineTextFieldView(text: $inputPhoneNum, textField: phoneView, placeholder: "전화번호를 입력하세요")
                
            
            }
            
            VStack {
                
                if (wrongInput) {
                    Text("체크인 정보가 일치하지 않습니다")
                        .font(.custom("YUniverse-L", size: 14))
                        .foregroundColor(Color("RedColor"))
                }
            }
            .padding(.bottom, 70)
            
            Button {
                if (inputRoomNum != "" && inputPhoneNum != "") {
                    roomController.chkin(chkinDTO: CheckinDTO(roomNumber: Int(inputRoomNum) ?? 0, phoneNumber: inputPhoneNum))
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
                      // 0.5초 후 실행될 부분
                        guest = roomController.guestData
                        isChkin = roomController.returnIsChkin
                        isPresented = roomController.returnIsPresented
                        if (roomController.returnIsChkin == false) {
                            wrongInput = true
                        } else {
                            wrongInput = false
                        }
                    }

                } else {
                    wrongInput = true
                }
            } label: {
                Text("체크인")
                    .font(.custom("YUniverse-B", size:20))
                    .foregroundColor(Color("GoldColor"))
                    .frame(maxWidth: .infinity)
            }
            .padding(.vertical, 20)
            .background(Color("GreenColor"))
            .cornerRadius(16)
            
        }
        .padding(30)
        .onDisappear() {
            isPresented = false
        }

        
    }
}

extension ChkinView {
    private var roomView: some View {
        TextField("", text: $inputRoomNum)
           .font(.custom("YUniverse-B", size:16))
           .disableAutocorrection(true)
           .textInputAutocapitalization(.never)
    }
    
    private var phoneView: some View {
        TextField("", text: $inputPhoneNum)
            .font(.custom("YUniverse-B", size:16))
           .disableAutocorrection(true)
           .textInputAutocapitalization(.never)
    }
}


