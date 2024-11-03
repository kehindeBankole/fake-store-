//
//  HotSalesView.swift
//  store
//
//  Created by Kehinde Bankole on 03/11/2024.
//

import SwiftUI

let placeHolder : ProductModel = ProductModel(id: -1, title: "", price:.zero, description: "", category: "", image: "", rating: Rating(rate: .zero, count: .zero))

struct HotSalesView: View {
    @State private var products: [ProductModel]? = nil
    @State private var isLoading = false
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .top){
                
                ForEach(products ?? Array(repeating: placeHolder, count: 3), id:\.id){product in
                    Button(action:{}){
                        ProductCardView(product: product).redacted(reason: isLoading ? .placeholder : [])
                    }
                }
                
                
            }
            //.scrollTargetLayout().padding(.trailing)
        }
//        .scrollTargetBehavior(.viewAligned)
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

#Preview {
    HotSalesView()
}
