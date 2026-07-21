//
//  Coordinator.swift
//  Ecommerce
//
//  Created by Lokesh Pandranki on 13/07/26.
//


// Coordinator/Coordinator.swift
import Combine
import SwiftUI

@MainActor
final class Coordinator: ObservableObject {
    @Published var path = NavigationPath()

    private let container: AppContainer

    init(container: AppContainer) {
        self.container = container
    }

    func showProductList() -> some View {
        ProductListView(
            viewModel: container.makeProductListViewModel(),
            onSelectProduct: { [weak self] product in
                self?.push(.productDetail(product))
            }
        )
    }

    func push(_ route: Route) {
        path.append(route)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    @ViewBuilder
    func destination(for route: Route) -> some View {
        switch route {
        case .productDetail(let product):
            ProductDetailView(viewModel: container.makeProductDetailViewModel(product: product))
        }
    }
}
