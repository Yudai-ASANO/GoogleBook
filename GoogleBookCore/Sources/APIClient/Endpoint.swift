//
//  Endpoint.swift
//  
//
//  Created by Yudai Asano on 2023/11/08.
//

import Foundation
import Moya

// MARK: - Endpoint

public protocol Endpoint: TargetType {
    associatedtype Response: Codable

    func sendRequest() async throws -> Response
}

public extension Endpoint {
    var baseURL: URL {
        return Session.baseURL
    }

    var headers: [String: String]? {
        return nil
    }

    var sampleData: Data {
        return Data()
    }

    func sendRequest() async throws -> Response {
        try await Session.send(request: self)
    }
}
