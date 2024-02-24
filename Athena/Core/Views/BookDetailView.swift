//
//  BookDetailView.swift
//  Athena
//
//  Created by Lautaro Bonasora on 24/02/2024.
//

import SwiftUI

struct BookDetailView: View {
    let book: BookModel
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject private var vm: BooksViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(book.title ?? "Título Desconocido")
                .font(.title)
                .fontWeight(.bold)
            Text("Autor: \(book.author ?? "Autor Desconocido")")
            Text("ISBN: \(book.ISBN ?? "ISBN Desconocido")")
            Text("Año de Publicación: \(book.publicationYear.map { String($0) } ?? "Año Desconocido")")
            Text("Género: \(book.genre ?? "Género Desconocido")")
            Text("Editorial: \(book.publisher ?? "Editorial Desconocida")")
            
            Spacer()
            
            Button(action: deleteBook) {
                           Text("Eliminar Libro")
                    .foregroundColor(ColorTheme().background)
                               .padding()
                               .background(ColorTheme().frenchBlue)
                               .cornerRadius(8)
                       }
        }
        .padding()
        .navigationBarTitle(book.title ?? "Detalle del Libro", displayMode: .inline)
    }
    
    func deleteBook() {
        Task {
            await vm.deleteBook(id: book.id ?? "")
        }
        presentationMode.wrappedValue.dismiss()
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleBook = BookModel(id: "1",
                                   title: "Sample Book",
                                   author: "John Doe",
                                   ISBN: "1234567890",
                                   publicationYear: 2022,
                                   genre: "Fiction",
                                   publisher: "Publisher X", url: nil)
        return BookDetailView(book: sampleBook)
    }
}

