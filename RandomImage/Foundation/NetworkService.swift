//
//  NetworkService.swift
//  RandomImage
//
//  Created by gnksbm on 9/5/24.
//

import Foundation

final class NetworkService: ObservableObject {
    func request(url: URL?) async throws -> Data {
        if let url {
            try await URLSession.shared.data(from: url).0
        } else {
            throw NetworkError.invalidURL
        }
    }
    
    enum NetworkError: Error {
        case invalidURL
    }
}
