//
//  RowView.swift
//  Athena
//
//  Created by Lautaro Bonasora on 17/12/2023.
//

import SwiftUI

struct RowView: View {
    let books: [BookModel]
    let width: CGFloat
    let height: CGFloat
    let horizontalSpacing: CGFloat
    
    var body: some View {
        HStack(spacing: horizontalSpacing, content: {
            ForEach(books) { book in
                BookView(title: book.title ?? "")
                    .frame(width: width, height: height)
            }
        })
        .padding()
    }
}

/*
struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        /
    }
}*/
