//
//  ProductListView.swift
//  Ecommerce
//
//  Created by Lokesh Pandranki on 13/07/26.
//

// Presentation/ProductList/ProductListView.swift
import SwiftUI

struct ProductListView: View {
    @StateObject private var viewModel: ProductListViewModel
    let onSelectProduct: (Product) -> Void

    init(viewModel: ProductListViewModel, onSelectProduct: @escaping (Product) -> Void) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.onSelectProduct = onSelectProduct
    }

    var body: some View {
        Group {
            if viewModel.isLoading && viewModel.products.isEmpty {
                ProgressView("Loading products…")
            } else if let error = viewModel.errorMessage {
                ContentUnavailableView(error, systemImage: "wifi.slash")
            } else {
                List(viewModel.products, id: \.id) { product in
                    Button {
                        onSelectProduct(product)
                    } label: {
                        ProductRow(product: product)
                    }
                    .buttonStyle(.plain)
                }
                .refreshable { await viewModel.loadProducts() }
            }
        }
        .navigationTitle("Products")
        .task { await viewModel.loadProducts() }
    }
}

private struct ProductRow: View {
    let product: Product

    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: product.thumbnailURL) { image in
                image.resizable().aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray.opacity(0.2)
            }
            .frame(width: 56, height: 56)
            .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 4) {
                Text(product.title).font(.headline)
                Text("$\(product.price, specifier: "%.2f")").font(.subheadline).foregroundStyle(.secondary)
            }
        }
    }
}
