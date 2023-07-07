//
//  CheckinView.swift
//  Hotel Princess
//
//  Created by 장세희 on 2023/05/23.
//

import SwiftUI

struct StartView: View {
    
    @State private var showChkinView = false
    
    @State private var isChkin = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                VStack {
                    Image("ChkinKeyImg")
                        .resizable()
                        .aspectRatio(0.5, contentMode: .fit)
                        .clipped() //프레임을 벗어나는 이미지 제거
                        .padding(.horizontal, 80)
                        .padding(.bottom, 40)
                    Button {
                        showChkinView = true
                    } label: {
                        Text("체크인하기")
                            .font(.custom("YUniverse-B", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color("GreenColor"))
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.vertical, 20)
                    .background(Color("GoldColor"))
                    .cornerRadius(20)
                    .sheet(isPresented: $showChkinView) {
                        ChkinView(
                            isPresented: $showChkinView, isChkin: $isChkin)
                    }
                    
                }
                .padding(30)
                
                
                NavigationLink(destination: MainView().navigationBarBackButtonHidden(true),
                               isActive: $isChkin, label:{})
                .navigationBarHidden(true)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("GreenColor"))
            
        }
    }
}
