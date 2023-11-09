// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let book = try? newJSONDecoder().decode(Book.self, from: jsonData)

import Foundation

// MARK: - Book
public struct BookResponse: Codable {
    public let kind: String?
    public let totalItems: Int?
    public let items: [Item]?
}

// MARK: - Item
public struct Item: Codable {
    public let kind: Kind?
    public let id, etag: String?
    public let selfLink: String?
    public let volumeInfo: VolumeInfo?
    public let saleInfo: SaleInfo?
    public let accessInfo: AccessInfo?
    public let searchInfo: SearchInfo?
}

// MARK: - AccessInfo
public struct AccessInfo: Codable {
    public let country: Country?
    public let viewability: Viewability?
    public let embeddable, publicDomain: Bool?
    public let textToSpeechPermission: TextToSpeechPermission?
    public let epub, pdf: Epub?
    public let webReaderLink: String?
    public let accessViewStatus: AccessViewStatus?
    public let quoteSharingAllowed: Bool?
}

public enum AccessViewStatus: String, Codable {
    case none = "NONE"
    case sample = "SAMPLE"
}

public enum Country: String, Codable {
    case jp = "JP"
}

// MARK: - Epub
public struct Epub: Codable {
    public let isAvailable: Bool?
    public let acsTokenLink: String?
}

public enum TextToSpeechPermission: String, Codable {
    case allowed = "ALLOWED"
}

public enum Viewability: String, Codable {
    case noPages = "NO_PAGES"
    case partial = "PARTIAL"
}

public enum Kind: String, Codable {
    case booksVolume = "books#volume"
}

// MARK: - SaleInfo
public struct SaleInfo: Codable {
    public let country: Country?
    public let saleability: Saleability?
    public let isEbook: Bool?
    public let listPrice, retailPrice: SaleInfoListPrice?
    public let buyLink: String?
    public let offers: [Offer]?
}

// MARK: - SaleInfoListPrice
public struct SaleInfoListPrice: Codable {
    public let amount: Int?
    public let currencyCode: String?
}

// MARK: - Offer
public struct Offer: Codable {
    public let finskyOfferType: Int?
    public let listPrice, retailPrice: OfferListPrice?
}

// MARK: - OfferListPrice
public struct OfferListPrice: Codable {
    public let amountInMicros: Int?
    public let currencyCode: String?
}

public enum Saleability: String, Codable {
    case forSale = "FOR_SALE"
    case notForSale = "NOT_FOR_SALE"
}

// MARK: - SearchInfo
public struct SearchInfo: Codable {
    public let textSnippet: String?
}

// MARK: - VolumeInfo
public struct VolumeInfo: Codable {
    public let title, subtitle: String?
    public let authors: [String]?
    public let publishedDate, volumeInfoDescription: String?
    public let industryIdentifiers: [IndustryIdentifier]?
    public let readingModes: ReadingModes?
    public let pageCount: Int?
    public let printType: PrintType?
    public let maturityRating: MaturityRating?
    public let allowAnonLogging: Bool?
    public let contentVersion: String?
    public let imageLinks: ImageLinks?
    public let language: Language?
    public let previewLink: String?
    public let infoLink: String?
    public let canonicalVolumeLink: String?
    public let panelizationSummary: PanelizationSummary?
    public let publisher: String?
    public let categories: [String]?
    public let averageRating: Double?
    public let ratingsCount: Int?

    enum CodingKeys: String, CodingKey {
        case title, subtitle, authors, publishedDate
        case volumeInfoDescription = "description"
        case industryIdentifiers, readingModes, pageCount, printType, maturityRating, allowAnonLogging, contentVersion, imageLinks, language, previewLink, infoLink, canonicalVolumeLink, panelizationSummary, publisher, categories, averageRating, ratingsCount
    }
}

// MARK: - ImageLinks
public struct ImageLinks: Codable {
    public let smallThumbnail, thumbnail: String?
}

// MARK: - IndustryIdentifier
public struct IndustryIdentifier: Codable {
    public let type: TypeEnum?
    public let identifier: String?
}

public enum TypeEnum: String, Codable {
    case isbn10 = "ISBN_10"
    case isbn13 = "ISBN_13"
    case other = "OTHER"
}

public enum Language: String, Codable {
    case ja = "ja"
    case un = "un"
}

public enum MaturityRating: String, Codable {
    case notMature = "NOT_MATURE"
}

// MARK: - PanelizationSummary
public struct PanelizationSummary: Codable {
    public let containsEpubBubbles, containsImageBubbles: Bool?
    public let epubBubbleVersion, imageBubbleVersion: String?
}

public enum PrintType: String, Codable {
    case book = "BOOK"
}

// MARK: - ReadingModes
public struct ReadingModes: Codable {
    public let text, image: Bool?
}
