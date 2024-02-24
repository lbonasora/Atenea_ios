//
//  BookModel.swift
//  Athena
//
//  Created by Lautaro Bonasora on 17/12/2023.
//

import Foundation

struct BookModel: Identifiable, Codable {
    let id: String?
    let title: String?
    let author: String?
    let ISBN: String?
    let publicationYear: Int?
    let genre: String?
    let publisher: String?
    var url: String?
}

struct BooksResponse: Codable {
    let count: Int?
    let books: [BookModel]
}
