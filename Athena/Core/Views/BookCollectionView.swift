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
    
    @EnvironmentObject private var vm: BooksViewModel
        
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(0..<vm.allBooks.count) { i in
                        if i % Int(itemPerRow) == 0 {
                            buildView(rowIndex: i, geometry: geometry)
                        }
                    }
                }
            }
            
        }
    }
    
    func buildView(rowIndex: Int, geometry: GeometryProxy) -> RowView? {
        var rowBooks = [BookModel]()
        
        for itemIndex in 0..<Int(itemPerRow) {
            if rowIndex + itemIndex < vm.allBooks.count {
                rowBooks.append(vm.allBooks[rowIndex + itemIndex])
            }
        }
        
        if !rowBooks.isEmpty {
            return RowView(books: rowBooks, width: getWidth(geometry: geometry), height: height, horizontalSpacing: horizontalSpacing)
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
