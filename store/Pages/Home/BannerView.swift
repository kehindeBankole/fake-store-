//
//  BannerView.swift
//  store
//
//  Created by Kehinde Bankole on 02/11/2024.
//

import SwiftUI

struct BannerView: View {
    var body: some View {
        ZStack(alignment: .trailing){
            HStack{
                VStack(alignment: .leading , spacing : 10){
                    Group{
                        Text("CYBER")
                        Text("LINIO")
                    }
                    .font(.moriRegular(size: 24))
                    .fontWeight(.bold)
                    .foregroundStyle(Color.customYellow)
                    Group{
                        
                        Text("40%").font(.system(size: 20).weight(.bold))
                        + Text("\(" ")DSCNT").font(.moriRegular(size: 8))
                             Text("in technology").font(.moriRegular(size: 14))
                    }.foregroundStyle(.white).frame(width: 300, alignment: .leading)
                    Text("FREE SHIPPING")
                        .foregroundStyle(Color.customOrange)
                        .font(.system(size: 8).weight(.bold))
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 24).fill(.white))
                      
                }
                Spacer()
              
            }
            
            VStack{
           
                    Image("switch")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 174)
                        .offset(y : -40)
            
                
            }
            
            Image("buds")
                .resizable()
                .scaledToFit()
                .frame(height: 96)
                .offset(y:70)

            }
        .frame(maxWidth : .infinity)
        .frame(height : 149)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.customPink, .customPurple]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                    )
                    
            )
    }
}

#Preview {
    BannerView()
}
