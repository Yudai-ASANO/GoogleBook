//
//  GetSearchResult.swift
//  
//
//  Created by Yudai Asano on 2023/11/08.
//

import Moya

public struct GetSearchResult: Endpoint {
    public typealias Response = BookResponse
    
    public init(keyword: String) {
        self.keyword = keyword
    }
    
    public var path: String {
        "/books/v1/volumes"
    }
    
    public var method: Moya.Method {
        .get
    }
    
    public var task: Moya.Task {
        .requestParameters(parameters: ["q": keyword], encoding: URLEncoding.default)
    }
    
    private let keyword: String
}

public struct MockGetSearchResult: Endpoint {
    public typealias Response = BookResponse
    
    public init(keyword: String) {
        self.keyword = keyword
    }
    
    public var path: String {
        "/books/v1/volumes"
    }
    
    public var method: Moya.Method {
        .get
    }
    
    public var task: Moya.Task {
        .requestParameters(parameters: ["q": keyword], encoding: URLEncoding.default)
    }
    
    private let keyword: String
}
