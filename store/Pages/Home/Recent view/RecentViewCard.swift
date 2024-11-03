//
//  RecentViewCard.swift
//  store
//
//  Created by Kehinde Bankole on 03/11/2024.
//

import SwiftUI

struct RecentViewCard: View {
    @State var product : ProductModel
    @Binding var favourited : [ProductModel]
    
    
    var body: some View {
        LazyVStack(alignment : .leading ,  spacing : 10){
            let isFav = favourited.contains(where: {$0.id == product.id})
            HStack{
                Spacer()
                Button(action:{
                    withAnimation(.none){
                        if(!isFav){
                            favourited.append(product)
                        }else{
                            favourited =  favourited.filter{$0.id != product.id}
                        }
                    }
                    print(favourited.count)
                }){
                    
                    Image("likes")
                        .foregroundStyle(!isFav ? Color.customOrange : Color.white)
                        .padding(5)
                        .background(Circle().fill(isFav ? Color.customOrange : .white))
                }
            }
            AsyncImage(url: URL(string: product.image)) { image in
                           image.resizable()
                       } placeholder: {
                           Color.gray
                       }
                       .frame(height: 150)
                       .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(product.title).font(.moriRegular(size: 10)).foregroundStyle(.black)
            Text(product.price , format: .currency(code: Locale.current.currency?.identifier ?? "USD")).font(.moriSemiBold(size: 17)).foregroundStyle(.black)
        }
        .frame(width: 128 ,  height: 250)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.customCream)
        )

    }
}

#Preview {
    RecentViewCard( product: .init(id: 19, title: "", price: 23, description: "", category: "", image: "",rating: .init(rate: 4.3, count: 12)) , favourited: .constant([]))
}
