//
//  BookCollectionView.swift
//  Athena
//
//  Created by Lautaro Bonasora on 17/12/2023.
//

import SwiftUI

struct BookCollectionView: View {
    let itemPerRow: CGFloat = 2
    let horizontalSpacing: CGFloat = 16
    let height: CGFloat = 350
    
    @EnvironmentObject var vm: BooksViewModel
      
    
    var body: some View {
            NavigationStack {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: horizontalSpacing),
                                  GridItem(.flexible(), spacing: horizontalSpacing)], spacing: horizontalSpacing) {
                            ForEach(vm.allBooks) { book in
                                NavigationLink(destination: BookDetailView(book: book)) {
                                    BookView(title: book.title ?? "")
                                        .frame(height: height)
                                }
                            }
                        }
                    }
                    .refreshable {
                        await vm.fetchData()
                    }
                    .task {
                        await vm.fetchData()
                    }
                    .padding(15)
            }
        }
    
    /*
    var body: some View {

        NavigationStack {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(0..<vm.allBooks.count) { i in
                                if i % Int(itemPerRow) == 0 {
                                    buildView(rowIndex: i)
                                }
                            }
                        }
                    }
                    .refreshable {
                        await vm.fetchData()
                    }
                    .task {
                        await vm.fetchData()
                    }
        }
    }*/
        
        
    func buildView(rowIndex: Int) -> RowView? {
        var rowBooks = [BookModel]()
        
        for itemIndex in 0..<Int(itemPerRow) {
            if rowIndex + itemIndex < vm.allBooks.count {
                rowBooks.append(vm.allBooks[rowIndex + itemIndex])
            }
        }
        
        if !rowBooks.isEmpty {
            return RowView(books: rowBooks, width: 160.0, height: height, horizontalSpacing: horizontalSpacing)
        }
        
        return nil
    }
    
    func getWidth(geometry: GeometryProxy) -> CGFloat {
        let width: CGFloat = (geometry.size.width - horizontalSpacing * (itemPerRow + 1)) / itemPerRow
        return width
    }
    
    
}

struct BookCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BookCollectionView()
        }
        .environmentObject(dev.homeVM)
    }
}
