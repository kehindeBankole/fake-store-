//
//  ProductsModel.swift
//  store
//
//  Created by Kehinde Bankole on 03/11/2024.
//

import Foundation

struct ProductModel : Decodable , Hashable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
}

struct Rating: Decodable , Hashable {
    let rate: Double
    let count: Int
}
