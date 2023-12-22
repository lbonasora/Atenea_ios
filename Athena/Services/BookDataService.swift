//
//  BookDataService.swift
//  Athena
//
//  Created by Lautaro Bonasora on 17/12/2023.
//

import Foundation
import Combine

class BookDataService {
    @Published var books: [BookModel] = []
    var bookSubscription: AnyCancellable?
    
    init(){
        getBooks()
    }
    
    private func getBooks() {
        
        guard let url = URL(string: "http://localhost:8000/books/") else { return }
        
        bookSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode <= 300 else {
                    throw URLError(.badServerResponse)
                }
                
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: BooksResponse.self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] (returnedBooks) in
                self?.books = returnedBooks.books
                self?.bookSubscription?.cancel()
            }
    }
}
