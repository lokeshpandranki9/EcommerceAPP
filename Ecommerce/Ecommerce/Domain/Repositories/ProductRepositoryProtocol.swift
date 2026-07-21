//
//  ProductRepositoryProtocol.swift
//  Ecommerce
//
//  Created by Lokesh Pandranki on 13/07/26.
//

import Foundation

// Domain/Repositories/ProductRepositoryProtocol.swift
protocol ProductRepositoryProtocol {
    func fetchProducts(limit: Int, skip: Int) async throws -> [Product]
    func fetchProduct(id: Int) async throws -> Product
}
