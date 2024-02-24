//
//  BookViewModel.swift
//  Athena
//
//  Created by Lautaro Bonasora on 17/12/2023.
//

import Foundation
import SwiftUI

class BooksViewModel: ObservableObject {
    
    @Published var allBooks: [BookModel] = []
    @Published var isLoading: Bool = false
    @Published var isCreating: Bool = false

    private let asyncDataBookService = AsyncBookDataService()
    
    
    init() {
        loadData()
    }
    
    func fetchData() async {
            do {
                let books = try await asyncDataBookService.getBooks()
                DispatchQueue.main.async {
                    self.allBooks = books
                }
            } catch {
                print(error)
            }
    }
    
    func loadData() {
        Task {
            await fetchData()
        }
    }
    
    func createBook(_ newBook: BookModel) async {
        
        do {
            let wasCreated = try await asyncDataBookService.postBook(newBook)
            
            if wasCreated {
                   print("BOOK CREATED")
               } else {
                   print("SOMETHING Happened")
               }
            
        } catch {
            print("Error: \(error)")
        }
    }
    
    func deleteBook(id: String) async {
        do {
            try await asyncDataBookService.deleteBook(withID: id)
            print("Book deleted successfully.")
        } catch {
            print("Error deleting book: \(error)")
        }
    }
}

