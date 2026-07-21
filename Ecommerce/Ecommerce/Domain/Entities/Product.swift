//
//  Product.swift
//  Ecommerce
//
//  Created by Lokesh Pandranki on 13/07/26.
//

// Domain/Entities/Product.swift

import Foundation

struct Product: Hashable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let category: String
    let thumbnailURL: URL?
    let rating: Double
}
