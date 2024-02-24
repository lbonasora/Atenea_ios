//
//  ContentView.swift
//  Athena
//
//  Created by Lautaro Bonasora on 17/12/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var booksViewModel = BooksViewModel()
    
    var body: some View {
        NavigationStack {
            
            TabView {
                BookCreatorView()
                    .tabItem {
                        Label("Crear Libro", systemImage: "plus.circle")
                    }
                
                BookCollectionView()
                    .tabItem{
                        Label("Libros", systemImage: "books.vertical")
                    }
                    .environmentObject(booksViewModel)
            }
            .navigationBarTitle("Athena", displayMode: .inline)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
