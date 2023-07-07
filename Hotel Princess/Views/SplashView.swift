//
//  StartView.swift
//  Hotel Princess
//
//  Created by 장세희 on 2023/05/23.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                StartView()
            } else {
                ZStack {
                    Image("RoomKeyImg")
                        .resizable()
                        .aspectRatio(0.5, contentMode: .fit)
                        .clipped() //프레임을 벗어나는 이미지 제거
                        .padding(.horizontal, 80)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("GreenColor"))
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
        
        
    }
}
