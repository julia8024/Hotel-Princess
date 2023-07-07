//
//  DesignModefier.swift
//  Hotel Princess
//
//  Created by 장세희 on 2023/06/03.
//

import SwiftUI


struct GreenTitle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.custom("YUniverse-B", size: 24))
            .foregroundColor(Color("GreenColor"))
    }
}

struct GreenText: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.custom("YUniverse-B", size: 20))
            .foregroundColor(Color("GreenColor"))
    }
}

struct GreenText16: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("YUniverse-B", size: 16))
            .foregroundColor(Color("GreenColor"))
    }
}

struct GreenText14: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("YUniverse-B", size: 14))
            .foregroundColor(Color("GreenColor"))
    }
}

struct GoldTitle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.custom("YUniverse-B", size: 24))
            .foregroundColor(Color("GoldColor"))
    }
}

struct GoldText: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.custom("YUniverse-B", size: 20))
            .foregroundColor(Color("GoldColor"))
    }
}

struct GoldText18: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.custom("YUniverse-B", size: 18))
            .foregroundColor(Color("GoldColor"))
    }
}

struct GoldText16: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.custom("YUniverse-B", size: 16))
            .foregroundColor(Color("GoldColor"))
    }
}

struct GoldText14: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.custom("YUniverse-B", size: 14))
            .foregroundColor(Color("GoldColor"))
    }
}

struct IconSetting: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .environment(\.symbolVariants, .none)
            .font(.system(size: 20))
            .foregroundColor(Color("GreenColor"))
    }
}

struct IconGreen32: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .environment(\.symbolVariants, .none)
            .font(.system(size: 32))
            .foregroundColor(Color("GreenColor"))
    }
}

struct IconGold16: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .environment(\.symbolVariants, .none)
            .font(.system(size: 16))
            .foregroundColor(Color("GoldColor"))
    }
}

// roundBox

/*
 .frame(maxWidth: .infinity, maxHeight: .infinity)
 .overlay(
     ZStack {
         RoundedRectangle(cornerRadius: 16)
             .stroke(.gray, lineWidth: 2)
     }
 )
 
 */

// Border RoundBox
/*
 .frame(maxWidth: .infinity)
 .overlay(
     ZStack {
         RoundedRectangle(cornerRadius: 16)
             .stroke(.gray, lineWidth: 2)
     }
 )
 
 */
