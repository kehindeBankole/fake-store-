//
//  ProductView.swift
//  store
//
//  Created by Kehinde Bankole on 03/11/2024.
//

import SwiftUI

struct ProductView: View {
    @State var product : ProductModel
    @Binding var nav : [ProductModel]
    
    var body: some View {
        VStack{
            ScrollView{
                AsyncImage(url: URL(string: product.image)) { image in
                               image.resizable()
                        .aspectRatio(contentMode: .fit)
                           } placeholder: {
                               Color.gray
                           }.frame(height: 236)
            }
            Spacer()
            VStack(spacing : 15){
                Button(action: {}){
                    Text("Add to cart")
                        .font(.moriSemiBold(size: 18))
                        .foregroundStyle(.white)
                        .padding(20)
                        .frame(maxWidth : .infinity)
                        .background(RoundedRectangle(cornerRadius: 55).fill(.black))
                    
                }
                
                Button(action: {}){
                    Text("Buy Now")
                        .font(.moriSemiBold(size: 18))
                        .foregroundStyle(.white)
                        .padding(20)
                        .frame(maxWidth : .infinity)
                        .background(RoundedRectangle(cornerRadius: 55).fill(Color.customOrange))
                    
                }
                
            }
        }
        .toolbar{
            ToolbarItem(placement: .principal){
                HStack(alignment: .center){
                    Button(action: {
                        nav.removeLast()
                    }){
                        Image(systemName: "chevron.left")
                            .foregroundStyle(Color.neutralSecond)
                            .padding(15)
                            .background(Circle().fill(Color.offWhite))
                    }
                    Spacer()
                    Button(action: {
                     
                    }){
                        Image("likes")
                            .foregroundStyle(Color.neutralSecond)
                            .padding(15)
                            .background(Circle().fill(Color.offWhite))
                    }
                    
                    Button(action: {
                     
                    }){
                  Image(systemName: "square.and.arrow.up")
                            .foregroundStyle(Color.neutralSecond)
                            .padding(15)
                            .background(Circle().fill(Color.offWhite))
                    }
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding()
    }
}


#Preview {
    ProductView(product: .init(id: 19, title: "", price: 23, description: "", category: "", image: "",rating: .init(rate: 4.3, count: 12)) , nav: .constant([]))
}
