//
//  TopView.swift
//  
//
//  Created by Yudai Asano on 2023/11/11.
//

import SwiftUI

public struct TopView: View {
    @ObservedObject private var model: TopModel
    
    public init(model: TopModel) {
        self.model = model
    }
    
    public var body: some View {
        content
            .task {
                await model.fetch(by: "abc")
            }
    }
    
    @ViewBuilder
    private var content: some View {
        switch model.state {
        case .idle, .loading:
            ProgressView()
        case .loaded(let book):
            ScrollView {
                LazyVStack(content: {
                    ForEach(book.volumes) { volume in
                        Text(volume.title)
                    }
                })
            }
            .refreshable {
                await model.fetch(by: "abc", shouldUpdateLoadingState: false)
            }
        case .error(let error):
            Text(error.localizedDescription)
        }
    }
}

#Preview {
    TopView(model: TopModel(repository: TopRepositoryMock()))
}
