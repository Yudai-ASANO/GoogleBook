//
//  RequestingView.swift
//  
//
//  Created by Yudai Asano on 2023/11/11.
//

import SwiftUI

public struct RequestingView<T: Endpoint, Content: View, Loading: View> : View {
    public typealias Reload = () async -> Void
    
    public let endpoint: T
    public let content: (T.Response, @escaping Reload) -> Content
    public let loading: Loading
    public let onError: ((Error) -> Void)?
    
    public init(
        _ endpoint: T,
        @ViewBuilder content: @escaping (T.Response, @escaping Reload) -> Content,
        loading: @escaping () -> Loading,
        onError: ((Error) -> Void)? = nil
    ) {
        self.endpoint = endpoint
        self.content = content
        self.loading = loading()
        self.onError = onError
    }
    
    public init(
        _ endpoint: T,
        @ViewBuilder content: @escaping (T.Response) -> Content,
        loading: @escaping () -> Loading,
        onError: ((Error) -> ())? = nil
    ) {
        self.endpoint = endpoint
        self.content = { response, reload in content(response) }
        self.loading = loading()
        self.onError = onError
    }
    
    public var body: some View {
        if let response {
            content(response, request)
        } else {
            loading
                .task {
                    await request()
                }
        }
    }
    
    @State private var response: T.Response?
    
    private func request() async {
        do {
            response = try await endpoint.sendRequest()
        } catch {
            onError?(error)
        }
    }
}
