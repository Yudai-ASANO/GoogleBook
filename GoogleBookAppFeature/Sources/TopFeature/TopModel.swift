//
//  TopModel.swift
//
//
//  Created by 浅野勇大 on 2023/12/22.
//

import Combine
import ClientModels

@MainActor
public final class TopModel: ObservableObject {
    @Published public private(set) var state: State<BookModel> = .idle
    
    public enum State<T> {
        case idle
        case loading
        case loaded(T)
        case error(Error)
    }
    
    public init(repository: TopRepositoryInterface) {
        self.repository = repository
    }
    
    public func fetch(by keyword: String, shouldUpdateLoadingState: Bool = true) async {
        if shouldUpdateLoadingState {
            self.state = .loading
        }
        do {
            let book = try await repository.fetch(by: keyword)
            self.state = .loaded(book)
        } catch {
            self.state = .error(error)
        }
    }
    
    private let repository: TopRepositoryInterface
}
