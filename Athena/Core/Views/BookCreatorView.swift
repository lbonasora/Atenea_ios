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
    
    
    let bookGenres = ["Fantasy", "Mystery", "Romance", "Science Fiction", "Thriller", "Non-fiction"]
    
    var body: some View {
        NavigationView {
            
            Form {
                Section {
                    TextField("Titulo", text: $title)
                    TextField("Autor", text: $author)
                    TextField("Año de Publicacion", text: $publicationYear).keyboardType(.numberPad)
                    Picker("Genero", selection: $genre) {
                        ForEach(bookGenres, id: \.self) { genre in
                                        Text(genre)
                                    }
                    }
                }
                
                Section {
                    TextField("Titulo", text: $title)
                    TextField("Autor", text: $author)
                    TextField("Año de Publicacion", text: $publicationYear).keyboardType(.numberPad)
                    Picker("Genero", selection: $genre) {
                        ForEach(bookGenres, id: \.self) { genre in
                                        Text(genre)
                                    }
                    }
                }
                
                Section {
                    TextField("Titulo", text: $title)
                    TextField("Autor", text: $author)
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
        }
    }
    
    func register() {
        
    }
}

struct BookCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BookCreatorView()
        }
        
    }
}
