//
//  BottomTab.swift
//  store
//
//  Created by Kehinde Bankole on 02/11/2024.
//

import SwiftUI

enum Tab : String  , CaseIterable {
    case home = "home"
    case cart = "cart"
    case likes = "likes"
//    case profile = "profile"
    
}

let icons  = ["home" : ""]

struct BottomTab: View {
    @Binding var selectedTab : Tab 
    @Namespace private var animationNameSpace
    
    var body: some View {
        HStack{
            ForEach(Tab.allCases , id:\.rawValue){ item in
                Spacer()
                Button(action: {
                    withAnimation(.smooth(duration: 0.3, extraBounce: 0)){
                        selectedTab = item
                    }
                }){
                    let isActive = selectedTab == item
                    ZStack(alignment: .center){
                        HStack{
                            Group{
                                Image("\(item)")
                                if(isActive){
                                    Text("\(item)".capitalized)
                                }
                                    
                            }.foregroundStyle(isActive ? Color.customOrange : Color.customNeutral)
                                .font(.moriSemiBold())
                           
                        }

                     
                        
                        if(isActive){
                            RoundedRectangle(cornerRadius: 65)
                                .fill(Color.customOrange)
                                .opacity(0.1)
                                .matchedGeometryEffect(id: "activeIndicator", in: animationNameSpace)
                            
                        }
                    
                    }.frame(maxHeight: 40)
                       
                }.frame(maxWidth : 101)
                
                Spacer()
            }
        }
    }
}

#Preview {
    BottomTab(selectedTab: .constant(.home))
}
