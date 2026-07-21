//
//  ProductListViewModel.swift
//  Ecommerce
//
//  Created by Lokesh Pandranki on 13/07/26.
//

// Presentation/ProductList/ProductListViewModel.swift
import Foundation
import Combine

@MainActor
final class ProductListViewModel: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var isLoading = false
    @Published var errorMessage: String?

    private let getProductsUseCase: GetProductsUseCaseProtocol

    init(getProductsUseCase: GetProductsUseCaseProtocol) {
        self.getProductsUseCase = getProductsUseCase
    }

    func loadProducts() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        do {
            products = try await getProductsUseCase.execute(limit: 20, skip: 0)
        } catch {
            errorMessage = "Couldn't load products. Pull to refresh to try again."
        }
    }
}
