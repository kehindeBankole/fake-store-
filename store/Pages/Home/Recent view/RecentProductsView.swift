//
//  RecentProductsView.swift
//  store
//
//  Created by Kehinde Bankole on 03/11/2024.
//

import SwiftUI

struct RecentProductsView: View {
    @State private var products: [ProductModel]? = nil
    @State private var isLoading = false
    @State var favourited : [ProductModel] = []
    @Binding var nav : [ProductModel]

    
    var body: some View {
      
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack(alignment: .top){
                    
                    ForEach(products ?? Array(repeating: placeHolder, count: 3), id:\.id){product in
                        Button(action:{
                            nav.append(product)
                     
                        }){
                            RecentViewCard(product: product , favourited: $favourited).redacted(reason: isLoading ? .placeholder : [])
                        }
                    }
                    
                    
                }.padding(.horizontal)
                
            }
            .task {
                do{
                    isLoading = true
                    let data : [ProductModel]? = try await Api.makeApiCall(url: "https://fakestoreapi.com/products")
                    products = data
    
                    isLoading = false
                }catch{
                    print(error)
                    isLoading = false
                }
            }
    }
}

//#Preview {
//    RecentProductsView()
//}
