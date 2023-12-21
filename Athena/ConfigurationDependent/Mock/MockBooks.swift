//
//  MockBooks.swift
//  Athena
//
//  Created by Lautaro Bonasora on 17/12/2023.
//

import Foundation

struct MockBooks {
    static var books = [
           BookModel(id: "1", title: "The Catcher in the Rye", author: "J.D. Salinger", ISBN: "0316769487", publicationYear: 1951, genre: "Fiction", publisher: "Little, Brown and Company", url: "https://example.com/book1"),
           BookModel(id: "2", title: "To Kill a Mockingbird", author: "Harper Lee", ISBN: "0061120081", publicationYear: 1960, genre: "Classic", publisher: "J.B. Lippincott & Co.", url: "https://example.com/book2"),
           BookModel(id: "3", title: "1984", author: "George Orwell", ISBN: "0451524934", publicationYear: 1949, genre: "Dystopian", publisher: "Secker & Warburg", url: "https://example.com/book3"),
           BookModel(id: "4", title: "Pride and Prejudice", author: "Jane Austen", ISBN: "0141439513", publicationYear: 1813, genre: "Classic", publisher: "T. Egerton, Whitehall", url: "https://example.com/book4"),
           BookModel(id: "5", title: "The Great Gatsby", author: "F. Scott Fitzgerald", ISBN: "9780743273565", publicationYear: 1925, genre: "Fiction", publisher: "Charles Scribner's Sons", url: "https://example.com/book5"),
           BookModel(id: "6", title: "Moby-Dick", author: "Herman Melville", ISBN: "1853260086", publicationYear: 1851, genre: "Classic", publisher: "Richard Bentley", url: "https://example.com/book6"),
           BookModel(id: "7", title: "The Chronicles of Narnia", author: "C.S. Lewis", ISBN: "9780064471087", publicationYear: 1950, genre: "Fantasy", publisher: "Geoffrey Bles", url: "https://example.com/book7"),
           BookModel(id: "8", title: "The Hobbit", author: "J.R.R. Tolkien", ISBN: "9780618260300", publicationYear: 1937, genre: "Fantasy", publisher: "Allen & Unwin", url: "https://example.com/book8"),
           BookModel(id: "9", title: "Harry Potter and the Philosopher's Stone", author: "J.K. Rowling", ISBN: "9780747532743", publicationYear: 1997, genre: "Fantasy", publisher: "Bloomsbury", url: "https://example.com/book9"),
           BookModel(id: "10", title: "The Hunger Games", author: "Suzanne Collins", ISBN: "9780439023481", publicationYear: 2008, genre: "Dystopian", publisher: "Scholastic Corporation", url: "https://example.com/book10")
       ]
}
