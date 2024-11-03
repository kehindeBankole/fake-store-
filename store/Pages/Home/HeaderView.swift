//
//  HeaderView.swift
//  store
//
//  Created by Kehinde Bankole on 02/11/2024.
//

import SwiftUI

struct HeaderView: View {
    @State var text = ""
    var body: some View {
        HStack(spacing: 30){
            HStack{
                Image("search").foregroundStyle(Color.customNeutral)
                TextField("Search products", text: $text)
            }
            .padding(.vertical , 16)
            .padding(.horizontal , 12)
            .background(
                RoundedRectangle(cornerRadius: 64)
                    .fill(Color.customOffwhite)
            )
     
            Button(action:{}){
                Image("notification")
                    .foregroundStyle(.neutralSecond)
                    .background(
                        Circle()
                            .fill(.offWhite)
                            .frame(width: 44 , height: 44)
                    )
                    
            }
       
        }.frame(maxWidth : .infinity)
            .padding(.trailing)
        
    }
}

#Preview {
    HeaderView()
}
