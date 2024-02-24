//
//  GoogleBookResponse.swift
//  Athena
//
//  Created by Lautaro Bonasora on 24/02/2024.
//

import Foundation

struct GoogleBooksResponse: Codable {
    let totalItems: Int
    let items: [BookItem]?
}

struct BookItem:  Codable{
    let volumeInfo: VolumeInfo?
}

struct VolumeInfo: Codable {
    let title: String?
    let authors: [String]?
    let publishedDate: String?
    let description: String?
    let industryIdentifiers: [IndustryIdentifier]?
    let pageCount: Int?
    let printType: String?
    let categories: [String]?
    let imageLinks: ImageLinks?
    let language: String?
    let previewLink: String?
    let infoLink: String?
    let canonicalVolumeLink: String?
}

struct IndustryIdentifier: Codable {
    let type: String?
    let identifier: String?
}

struct ImageLinks: Codable {
    let smallThumbnail: String?
    let thumbnail: String?
}
