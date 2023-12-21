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
            Color.theme.background
                .ignoresSafeArea()
            VStack {
                Text("Header")
                    .padding(.top)
                    .font(.headline)
                    .foregroundColor(.theme.raisinBlack)
                TabView {
                    VStack {
                        Color.theme.background
                    }
                    .tabItem{
                        Label("Mis Prestamos", systemImage: "list.bullet")
                    }
                    
                    VStack{
                        BookCollectionView()
                    }
                    .tabItem{
                        Label("Libros", systemImage: "books.vertical")
                    }
                }
                
            }
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
