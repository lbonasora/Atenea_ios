//
//  AsyncBookDataService.swift
//  Athena
//
//  Created by Lautaro Bonasora on 23/02/2024.
//

import Foundation

class AsyncBookDataService {
    @Published var books: [BookModel] = []
    let apiKey = "AIzaSyAefvVN7sbSXZXuASUWJcpw5GsDVQN_Bw8"
    
    init() {
        Task {
            do {
                self.books = try await getBooks()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
// Replace with your Google Books API key
        
        func searchBooksByTitle(title: String) async throws -> BookItem? {
            let encodedTitle = title.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            let urlString = "https://www.googleapis.com/books/v1/volumes?q=intitle:\(encodedTitle)&key=\(apiKey)"
            
            guard let url = URL(string: urlString) else {
                throw URLError(.badURL)
            }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(GoogleBooksResponse.self, from: data)
            
            if let firstBook = response.items?.first {
                return firstBook
            } else {
                return nil
            }
        }
    
    func completeWithGoogleData(_ books:[BookModel]) async throws {
        for book in books {
            if let title = book.title {
                let bookItem = try await searchBooksByTitle(title: title)
                //book.url = bookItem?.volumeInfo?.imageLinks?.thumbnail
            }
        }
    }
    
    func getBooks() async throws -> [BookModel] {
        guard let url = URL(string: "http://localhost:8000/books/") else { throw URLError(.badURL) }
        
        let (data, output) = try await URLSession.shared.data(from: url)
        
        guard let response = output as? HTTPURLResponse, response.statusCode >= 200 else {
            throw URLError(.badServerResponse)
        }
        
        let booksData = try JSONDecoder().decode(BooksResponse.self, from: data)
        return booksData.books
    }
    
    func postBook(_ newBook: BookModel) async throws -> Bool {
           guard let request = createPOSTRequest(with: newBook) else {
               return false
           }
           
           let (data, response) = try await URLSession.shared.data(for: request)
           
           guard let httpResponse = response as? HTTPURLResponse,
                 (200...299).contains(httpResponse.statusCode) else {
               throw URLError(.badServerResponse)
           }
           
           let decodedResponse = try JSONDecoder().decode(BooksResponse.self, from: data)
           
           return decodedResponse.count ?? 0 > 0
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
    
    func deleteBook(withID id: String) async throws {
            guard let url = URL(string: "http://localhost:8000/books/\(id)") else {
                throw URLError(.badURL)
            }
            
            // Create the URLRequest for DELETE method
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
            
            // Perform the DELETE request asynchronously
            let (data, _) = try await URLSession.shared.data(for: request)
            
            // Check if the deletion was successful
            if let httpResponse = data as? HTTPURLResponse {
                if !(200...299).contains(httpResponse.statusCode) {
                    // Handle error if deletion was not successful
                    throw URLError(.badServerResponse)
                }
            } else {
                throw URLError(.badServerResponse)
            }
        }
}
