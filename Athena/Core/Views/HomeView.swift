//
//  ContentView.swift
//  Athena
//
//  Created by Lautaro Bonasora on 17/12/2023.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ZStack {
                TabView {
                    VStack {
                        BookCreatorView()
                    }
                    .tabItem{
                        Label("Mis Prestamos", systemImage: "list.bullet")
                    }
                    
                    VStack{
                        // BookCollectionView()
                        Color.theme.raisinBlack
                    }
                    .tabItem{
                        Label("Libros", systemImage: "books.vertical")
                    }
                }
        }.navigationTitle("Test")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }.navigationTitle("Test")
    }
}
