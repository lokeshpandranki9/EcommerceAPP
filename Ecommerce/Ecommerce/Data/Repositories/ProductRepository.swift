//
//  ProductRepository.swift
//  Ecommerce
//
//  Created by Lokesh Pandranki on 13/07/26.
//

import Foundation

// Data/Repositories/ProductRepository.swift
final class ProductRepository: ProductRepositoryProtocol {
    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func fetchProducts(limit: Int, skip: Int) async throws -> [Product] {
        let response: ProductListResponseDTO = try await networkService.fetch(
            .products(limit: limit, skip: skip)
        )
        return response.products.map { $0.toDomain() }
    }

    func fetchProduct(id: Int) async throws -> Product {
        let dto: ProductDTO = try await networkService.fetch(.product(id: id))
        return dto.toDomain()
    }
}
