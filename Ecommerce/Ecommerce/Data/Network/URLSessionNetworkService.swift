//
//  URLSessionNetworkService.swift
//  Ecommerce
//
//  Created by Lokesh Pandranki on 13/07/26.
//

import Foundation

// Data/Network/URLSessionNetworkService.swift
final class URLSessionNetworkService: NetworkServiceProtocol {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func fetch<T: Decodable>(_ endpoint: APIEndpoint) async throws -> T {
        let (data, response) = try await session.data(from: endpoint.url)

        guard let http = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        guard (200...299).contains(http.statusCode) else {
            throw NetworkError.statusCode(http.statusCode)
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decoding(error)
        }
    }
}
