//
//  VolumeModel.swift
//  
//
//  Created by Yudai Asano on 2023/11/11.
//

import UIKit

public struct VolumeModel: Hashable {
    public let title, subtitle: String
    public let authors: [String]
    public let publishedDate, volumeInfoDescription: String
    public let publisher: String
    public let categories: [String]
    public let averageRating: Double
    public let ratingsCount: Int
    
    public init(title: String, subtitle: String, authors: [String], publishedDate: String, volumeInfoDescription: String, publisher: String, categories: [String], averageRating: Double, ratingsCount: Int) {
        self.title = title
        self.subtitle = subtitle
        self.authors = authors
        self.publishedDate = publishedDate
        self.volumeInfoDescription = volumeInfoDescription
        self.publisher = publisher
        self.categories = categories
        self.averageRating = averageRating
        self.ratingsCount = ratingsCount
    }
}

extension VolumeModel: Identifiable {
    public var id: String {
        title
    }
}
