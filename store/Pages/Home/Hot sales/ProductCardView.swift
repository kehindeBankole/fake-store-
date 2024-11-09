//
//  ProductCardView.swift
//  store
//
//  Created by Kehinde Bankole on 03/11/2024.
//

import SwiftUI

struct ProductCardView: View {
    @State var product : ProductModel

    var body: some View {
        VStack(alignment : .leading ,  spacing : 10){
          
            AsyncImage(url: URL(string: product.image)) { image in
                           image.resizable()
                       } placeholder: {
                           Color.gray
                       }
                       .frame(height: 150)
                       .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(product.title).font(.moriRegular(size: 10)).foregroundStyle(.black)
            Text(product.price , format: .currency(code: Locale.current.currency?.identifier ?? "USD")).font(.moriSemiBold(size: 17)).foregroundStyle(.black)
            Text("FREE SHIPPING")
                .foregroundStyle(Color.customGreen)
                .font(.system(size: 8).weight(.bold))
                .padding(5)
              
                .background(RoundedRectangle(cornerRadius: 24).fill(.white))
        }
        .frame(width: 128 ,  height: 230)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.customOffwhite)
        )

    }
}

#Preview {
    ProductCardView(product: .init(id: 19, title: "", price: 23, description: "", category: "", image: "",rating: .init(rate: 4.3, count: 12)))
}
