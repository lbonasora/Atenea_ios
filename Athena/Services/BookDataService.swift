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
    var bookPostSubscripton: AnyCancellable?
    
    init(){
        getBooks()
    }
    
    func getBooks() {
        
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
    
    func postBook(_ newBook: BookModel, completion: @escaping (Bool) -> Void) {
        guard let request = createPOSTRequest(with: newBook) else { return }
        
        bookPostSubscripton = URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode <= 300 else {
                    throw URLError(.badServerResponse)
                }
                
                return output.data
            }
            .decode(type: BooksResponse.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { response in
                switch response {
                case .finished:
                    print("Success")
                    break
                case .failure(let error):
                    print("Request failed with error: \(error.localizedDescription)")
                    completion(false)
                }
            }, receiveValue: { (returnedBooks) in
                completion(returnedBooks.count ?? 0 > 0)
                self.bookPostSubscripton?.cancel()
            })
    }
    
    func createPOSTRequest(with book: BookModel) -> URLRequest? {
        guard let url = URL(string: "http://localhost:8000/books/") else { return nil
        }
        
        let bookResponse = BooksResponse(count: 1, books: [book])
        
        // Create the URLRequest
           var request = URLRequest(url: url)
           request.httpMethod = "POST"
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")

           // Encode the BookModel into JSON data
           let encoder = JSONEncoder()
           do {
               let jsonData = try encoder.encode(bookResponse)
               request.httpBody = jsonData
           } catch {
               return nil
           }

           // Perform the request using URLSession and Combine
           return request
    }
    
    func deleteBook(id:String){
        
    }
    
    
    
}
