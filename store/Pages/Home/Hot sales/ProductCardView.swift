//
//  ProductCardView.swift
//  store
//
//  Created by Kehinde Bankole on 03/11/2024.
//

import SwiftUI

struct ProductCardView: View {
    var body: some View {
        LazyVStack(alignment : .leading ,  spacing : 10){
            Text("Macbook Air M1").font(.moriRegular(size: 10))
            Text("$ 29,999").font(.moriSemiBold(size: 17))
            Text("FREE SHIPPING")
                .foregroundStyle(Color.customGreen)
                .font(.system(size: 8).weight(.bold))
                .padding(5)
              
                .background(RoundedRectangle(cornerRadius: 24).fill(.white))
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.customOffwhite)
        )
    }
}

#Preview {
    ProductCardView()
}
