//
//  ProductDetailView.swift
//  Ecommerce
//
//  Created by Lokesh Pandranki on 13/07/26.
//

// Presentation/ProductDetail/ProductDetailView.swift
import SwiftUI

struct ProductDetailView: View {
    @StateObject private var viewModel: ProductDetailViewModel

    init(viewModel: ProductDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                AsyncImage(url: viewModel.product.thumbnailURL) { $0.resizable().aspectRatio(contentMode: .fit) }
                    placeholder: { Color.gray.opacity(0.2) }
                    .frame(height: 220)

                Text(viewModel.product.title).font(.title2.bold())
                Text(viewModel.product.category).font(.caption).foregroundStyle(.secondary)
                Text("$\(viewModel.product.price, specifier: "%.2f")").font(.title3)
                Text(viewModel.product.description).font(.body)
            }
            .padding()
        }
        .navigationTitle("Details")
    }
}
