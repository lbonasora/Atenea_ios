//
//  BookViewModel.swift
//  Athena
//
//  Created by Lautaro Bonasora on 17/12/2023.
//

import Foundation
import Combine

class BooksViewModel: ObservableObject {
    
    @Published var allBooks: [BookModel] = []
    
    private let dataBookService = BookDataService()
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataBookService.$books
            .sink { [weak self] (books) in
                self?.allBooks = books
            }
            .store(in: &cancellables)
    }
}

