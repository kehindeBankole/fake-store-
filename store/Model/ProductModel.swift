//
//  ProductsModel.swift
//  store
//
//  Created by Kehinde Bankole on 03/11/2024.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
}

// Nested model for rating information
struct Rating: Codable {
    let rate: Double
    let count: Int
}
