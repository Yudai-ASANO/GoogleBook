//
//  Session.swift
//
//
//  Created by Yudai Asano on 2023/11/08.
//

import Foundation
import Moya

public enum Session {
    public static var baseURL: URL = URL(string: "https://www.googleapis.com")!
    
    static func send<T: Codable>(request: TargetType) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(MultiTarget(request)) { result in
                switch result {
                case let .success(response):
                    do {
                        let decoder = JSONDecoder()
                        try continuation.resume(returning: decoder.decode(T.self, from: response.data))
                    } catch {
                        continuation.resume(throwing: error)
                    }
                    
                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
        
    private static let provider = MoyaProvider<MultiTarget>()
}
