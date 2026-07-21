//
//  AppContainer.swift
//  Ecommerce
//
//  Created by Lokesh Pandranki on 13/07/26.
//

// DI/AppContainer.swift
final class AppContainer {
    private lazy var networkService: NetworkServiceProtocol = URLSessionNetworkService()
    private lazy var productRepository: ProductRepositoryProtocol = ProductRepository(networkService: networkService)

    func makeProductListViewModel() -> ProductListViewModel {
        ProductListViewModel(getProductsUseCase: GetProductsUseCase(repository: productRepository))
    }

    func makeProductDetailViewModel(product: Product) -> ProductDetailViewModel {
        ProductDetailViewModel(product: product)
    }
}
