//
//  TopRepository.swift
//
//
//  Created by 浅野勇大 on 2023/12/22.
//

import APIClient
import ClientModels

public protocol TopRepositoryInterface {
    func fetch(by keyword: String) async throws -> BookModel
}

public struct TopRepository: TopRepositoryInterface {
    
    public init() {
    }
    
    public func fetch(by keyword: String) async throws -> BookModel {
        let endpoint = GetSearchResult(keyword: keyword)
        let response = try await endpoint.sendRequest()
        return transpile(response: response)
    }
    
    private func transpile(response: BookResponse) -> BookModel {
        let kind = response.kind ?? ""
        let items = response.items ?? []
        
        return BookModel(
            kind: kind,
            volumes: items.map({ item in
                VolumeModel(
                    title: item.volumeInfo?.title ?? "",
                    subtitle: item.volumeInfo?.subtitle ?? "",
                    authors: item.volumeInfo?.authors ?? [],
                    publishedDate: item.volumeInfo?.publishedDate ?? "",
                    volumeInfoDescription: item.volumeInfo?.volumeInfoDescription ?? "",
                    publisher: item.volumeInfo?.publisher ?? "",
                    categories: item.volumeInfo?.categories ?? [],
                    averageRating: item.volumeInfo?.averageRating ?? .zero,
                    ratingsCount: item.volumeInfo?.ratingsCount ?? .zero
                )
            })
        )
    }
}

public struct TopRepositoryMock: TopRepositoryInterface {
    public init() {
    }
    
    public func fetch(by keyword: String) async throws -> BookModel {
        return BookModel(
            kind: "books#volumes",
            volumes: [
                VolumeModel(
                    title: "SwiftUI",
                    subtitle: "Declarative Interfaces for any Apple Device",
                    authors: ["Apple Inc."],
                    publishedDate: "2019-10-24",
                    volumeInfoDescription: "",
                    publisher: "Apple Inc.",
                    categories: ["Computers"],
                    averageRating: 4.5,
                    ratingsCount: 10
                ),
                VolumeModel(
                    title: "Swift",
                    subtitle: "Declarative Interfaces for any Apple Device",
                    authors: ["Apple Inc."],
                    publishedDate: "2019-10-24",
                    volumeInfoDescription: "",
                    publisher: "Apple Inc.",
                    categories: ["Computers"],
                    averageRating: 4.5,
                    ratingsCount: 10
                ),
                VolumeModel(
                    title: "SwiftUIX",
                    subtitle: "Declarative Interfaces for any Apple Device",
                    authors: ["Apple Inc."],
                    publishedDate: "2019-10-24",
                    volumeInfoDescription: "",
                    publisher: "Apple Inc.",
                    categories: ["Computers"],
                    averageRating: 4.5,
                    ratingsCount: 10
                ),
                VolumeModel(
                    title: "Swift Package Manager",
                    subtitle: "Declarative Interfaces for any Apple Device",
                    authors: ["Apple Inc."],
                    publishedDate: "2019-10-24",
                    volumeInfoDescription: "",
                    publisher: "Apple Inc.",
                    categories: ["Computers"],
                    averageRating: 4.5,
                    ratingsCount: 10
                ),
                VolumeModel(
                    title: "SwiftPM",
                    subtitle: "Declarative Interfaces for any Apple Device",
                    authors: ["Apple Inc."],
                    publishedDate: "2019-10-24",
                    volumeInfoDescription: "",
                    publisher: "Apple Inc.",
                    categories: ["Computers"],
                    averageRating: 4.5,
                    ratingsCount: 10
                )
            ]
        )
    }
}
