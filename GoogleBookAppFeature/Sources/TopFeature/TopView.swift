//
//  TopView.swift
//  
//
//  Created by Yudai Asano on 2023/11/11.
//

import SwiftUI
import ClientModels
import APIClient

public struct TopView: View {
    public var body: some View {
        RequestingView(GetSearchResult(keyword: "abc")) { response, reload in
            let model = transpile(response: response)
            ScrollView {
                LazyVStack(content: {
                    ForEach(model.volumes) { volume in
                        Text(volume.title)
                    }
                })
            }
            .refreshable {
                await reload()
            }
        } loading: {
            ProgressView()
        }

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

#Preview {
    TopView()
}
