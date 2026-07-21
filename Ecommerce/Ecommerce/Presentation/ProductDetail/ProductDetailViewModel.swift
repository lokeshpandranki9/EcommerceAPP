//
//  ProductDetailViewModel.swift
//  Ecommerce
//
//  Created by Lokesh Pandranki on 13/07/26.
//

import Combine


// Presentation/ProductDetail/ProductDetailViewModel.swift
@MainActor
final class ProductDetailViewModel: ObservableObject {
    @Published private(set) var product: Product

    init(product: Product) {
        self.product = product
    }
}
