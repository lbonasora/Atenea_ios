//
//  BooksView.swift
//  Athena
//
//  Created by Lautaro Bonasora on 17/12/2023.
//

import SwiftUI

struct BookView: View {
        
    let title: String
    var body: some View {
        
        VStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.theme.celadon)
                        
                Text(title)
                        .font(.title2)
                        .foregroundColor(.theme.raisinBlack)
                        .lineLimit(2)
                        .frame(height: 56)
                        .frame(alignment: .leading)
        }

    }
}

struct BooksView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(title: "Das Buch Con un titulo muy muy muy largo")
    }
}
