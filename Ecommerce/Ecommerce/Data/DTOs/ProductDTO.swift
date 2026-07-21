//
//  ProductDTO.swift
//  Ecommerce
//
//  Created by Lokesh Pandranki on 13/07/26.
//

// DTO — mirrors the server's JSON exactly

import Foundation

// Data/DTOs/ProductDTO.swift
struct ProductListResponseDTO: Decodable {
    let products: [ProductDTO]
    let total: Int
    let skip: Int
    let limit: Int
}

struct ProductDTO: Decodable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let category: String
    let thumbnail: String
    let rating: Double
}

extension ProductDTO {
    /// DTO → Domain mapping happens at the boundary, never inside the ViewModel.
    func toDomain() -> Product {
        Product(
            id: id,
            title: title,
            description: description,
            price: price,
            category: category,
            thumbnailURL: URL(string: thumbnail),
            rating: rating
        )
    }
}
