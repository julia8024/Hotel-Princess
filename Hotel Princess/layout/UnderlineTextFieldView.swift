//
//  UnderlineTextFieldView.swift
//  Hotel Princess
//
//  Created by 장세희 on 2023/05/24.
//

import SwiftUI


struct UnderlineTextFieldView<TextFieldView>: View where TextFieldView: View {

     @Binding var text: String
     let textField: TextFieldView
     let placeholder: String

     
     var body: some View {
          HStack {
               underlineTextFieldView
          }
     }
}

extension UnderlineTextFieldView {
     
     private var underlineTextFieldView: some View {
          VStack {
               ZStack(alignment: .leading) {
                    if text.isEmpty {
                         placeholderView
                    }

               textField
                    .padding(.trailing, 16)
               }

               underlineView
          }
     }

     private var placeholderView: some View {
          Text(placeholder)
             .font(.custom("YUniverse-L", size:16))
             .foregroundColor(Color("GrayColor"))
     }

     private var underlineView: some View {
          Rectangle().frame(height: 1)
               .foregroundColor(Color("GreenColor"))
               .padding(.trailing, 16)
     }
}
