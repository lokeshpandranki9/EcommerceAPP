//
//  APIEndpoint.swift
//  Ecommerce
//
//  Created by Lokesh Pandranki on 13/07/26.
//

import Foundation

// Data/Network/APIEndpoint.swift
enum APIEndpoint {
    case products(limit: Int, skip: Int)
    case product(id: Int)

    var url: URL {
        var components = URLComponents(string: "https://dummyjson.com")!
        switch self {
        case .products(let limit, let skip):
            components.path = "/products"
            components.queryItems = [
                URLQueryItem(name: "limit", value: "\(limit)"),
                URLQueryItem(name: "skip", value: "\(skip)")
            ]
        case .product(let id):
            components.path = "/products/\(id)"
        }
        return components.url!
    }
}
