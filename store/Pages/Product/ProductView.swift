//
//  ProductView.swift
//  store
//
//  Created by Kehinde Bankole on 03/11/2024.
//

import SwiftUI

let colors = [Color.black, Color.gray , Color.border]
struct ProductView: View {
    @State var product : ProductModel
    @Binding var nav : [ProductModel]
    @State var selectedColor : Color = .black
    var body: some View {
        VStack{
            ScrollView(showsIndicators: false){
                VStack(spacing : 20){
                    AsyncImage(url: URL(string: product.image)) { image in
                                   image.resizable()
                            .aspectRatio(contentMode: .fit)
                               } placeholder: {
                                   RoundedRectangle(cornerRadius: 15).fill(Color.gray)
                               }.frame(height: 236)
                    
                    VStack(alignment: .leading, spacing : 20){
                        Text(product.title).font(.moriSemiBold(size: 24))
                            .frame(maxWidth : .infinity , alignment: .leading)
                        HStack{
                            Text(product.price , format: .currency(code: Locale.current.currency?.identifier ?? "USD")).font(.moriSemiBold(size: 20)).foregroundStyle(Color.customOrange)
                            Divider()
                            Text("Including taxes and duties").font(.moriRegular(size: 12)).foregroundStyle(Color.customNeutral)
                        }
                        
                        HStack{
                            HStack{
                                ForEach(colors , id: \.self){ color in
                                    ZStack{
                                        if(selectedColor == color){
                                            Circle()
                                                .stroke(lineWidth: 1)
                                                .fill(.black)
                                                .frame(width: 30, height: 30)
                                                .transition(.scale)
                                            
                                        }
                                        Circle().fill(color).frame(width: 22, height: 22)
                                    }.onTapGesture {
                                        withAnimation(.bouncy(duration: 0.2 , extraBounce: 0.2)){
                                            selectedColor = color
                                        }
                                    }
                                }
                            }
                            Spacer()
                            HStack(alignment: .center, spacing : 5){
                                Image(systemName: "star.fill").foregroundStyle(.yellow)
                                Text("4.8").font(.moriSemiBold(size: 18))
                                Text("(231)").font(.moriRegular(size: 12)).foregroundStyle(Color.customNeutral)
                            }
                        }
                    }
                }
            }
          
        }
        .safeAreaInset(edge:.bottom){
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
                
            }.padding(.vertical)
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
        .padding(.horizontal)
    }
}


#Preview {
    ProductView(product: .init(id: 19, title: "Sony WH-1000XM5", price: 23, description: "", category: "", image: "",rating: .init(rate: 4.3, count: 12)) , nav: .constant([]))
}
