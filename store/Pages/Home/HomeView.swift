//
//  HomeView.swift
//  store
//
//  Created by Kehinde Bankole on 02/11/2024.
//

import SwiftUI

let categories = [
    "Technology",
    "Fashion",
    "Sports",
    "Supermarket",
    "Women",
    "Men",
    "House hold"
]

struct HomeView: View {
    @State private var selectedTab : Tab = Tab.home
    @State private var productDetail : [ProductModel] = []
    
    var body: some View {
        
        NavigationStack(path : $productDetail){
            
            VStack{
                ScrollView(showsIndicators: false){
                    HeaderView()
                        .padding()
                    
                    VStack(spacing: 20){
                        BannerView().padding()
                        ScrollView(.horizontal , showsIndicators: false){
                            HStack{
                                ForEach(categories , id: \.self){ item in
                                    
                                    Text(item)
                                        .font(.moriSemiBold(size: 14))
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 16)
                                        .background(
                                            RoundedRectangle(cornerRadius: 15)
                                                .strokeBorder(Color.customBorderColor, lineWidth: 1)
                                        )
                                    
                                    
                                }
                            }.padding(.leading)
                            
                        }
                        VStack(spacing : 20){
                            HStack{
                                Text("Hot sales").font(.moriSemiBold())
                                Spacer()
                                
                            }
                            HotSalesView()
                        }.padding(.leading)
                        VStack(spacing : 20){
                            HStack{
                                Text("Recently viewed").font(.moriSemiBold())
                                Spacer()
                                
                            }
                            RecentProductsView(nav: $productDetail)
                        }.padding(.leading)
                    }
                }
                
                Spacer()
                BottomTab(selectedTab: $selectedTab)
                
            }
            .navigationDestination(for: ProductModel.self){ product in
                
                ProductView(product: product , nav: $productDetail)
                
            }
            
        }
    }
}

#Preview {
    HomeView()
}
