//
//  BookCreatorView.swift
//  Athena
//
//  Created by Lautaro Bonasora on 21/12/2023.
//

import SwiftUI

struct BookCreatorView: View {
    @State private var title = ""
    @State private var author = ""
    @State private var ISBN = ""
    @State private var publicationYear = ""
    @State private var genre = "Fantasy"
    @State private var publisher = ""
    @State private var url = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    @EnvironmentObject private var vm: BooksViewModel
    
    let bookGenres = ["Fantasy", "Mystery", "Romance", "Science Fiction", "Thriller", "Non-fiction"]
    
    var body: some View {
        NavigationView {
            
            Form {
                    Section {
                        TextField("Titulo", text: $title)
                        TextField("Autor", text: $author)
                        TextField("ISBN", text: $ISBN)
                        TextField("Editorial", text: $publisher)
                        TextField("Año de Publicacion", text: $publicationYear).keyboardType(.numberPad)
                        Picker("Genero", selection: $genre) {
                            ForEach(bookGenres, id: \.self) { genre in
                                            Text(genre)
                                        }
                        }
                    }
                    
                    Section {
                        Button(action: register) {
                          Text("Registrar")
                        }
                        .buttonStyle(.automatic)
                    }
                  
                }
            .alert(isPresented: $showAlert) {
                            Alert(title: Text("Resultado"),
                                  message: Text(alertMessage),
                                  dismissButton: .default(Text("Aceptar")))
                        }
                
        }
    }
    
    func register() {
        guard let year = Int(publicationYear) else {
            
                return
            }
        
            let newBook = BookModel(id: nil,
                                    title: title.isEmpty ? nil : title,
                                    author: author.isEmpty ? nil : author,
                                    ISBN: ISBN.isEmpty ? nil : ISBN,
                                    publicationYear: year,
                                    genre: genre.isEmpty ? nil : genre,
                                    publisher: publisher.isEmpty ? nil : publisher,
                                    url: nil)
        Task {
                    do {
                        await vm.createBook(newBook)
                        showAlert = true
                        alertMessage = "Libro creado exitosamente."
                    } catch {
                        showAlert = true
                        alertMessage = "Ocurrió un error al crear el libro."
                    }
        }
       
    }
}

struct BookCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BookCreatorView()
        }
        .environmentObject(dev.homeVM)
        
    }
}
