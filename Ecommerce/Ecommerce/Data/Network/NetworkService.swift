//
//  NetworkService.swift
//  Ecommerce
//
//  Created by Lokesh Pandranki on 13/07/26.
//

import Foundation

// Data/Network/NetworkService.swift
protocol NetworkServiceProtocol {
    func fetch<T: Decodable>(_ endpoint: APIEndpoint) async throws -> T
}

enum NetworkError: Error {
    case invalidResponse
    case statusCode(Int)
    case decoding(Error)
}
