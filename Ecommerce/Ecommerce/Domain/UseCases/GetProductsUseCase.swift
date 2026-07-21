//
//  GetProductsUseCase.swift
//  Ecommerce
//
//  Created by Lokesh Pandranki on 13/07/26.
//

import Foundation

// Domain/UseCases/GetProductsUseCase.swift
protocol GetProductsUseCaseProtocol {
    func execute(limit: Int, skip: Int) async throws -> [Product]
}

final class GetProductsUseCase: GetProductsUseCaseProtocol {
    private let repository: ProductRepositoryProtocol

    init(repository: ProductRepositoryProtocol) {
        self.repository = repository
    }

    func execute(limit: Int, skip: Int) async throws -> [Product] {
        let products = try await repository.fetchProducts(limit: limit, skip: skip)
        // Business rule lives HERE, not in the ViewModel or Repository:
        return products.sorted { $0.rating > $1.rating }
    }
}
