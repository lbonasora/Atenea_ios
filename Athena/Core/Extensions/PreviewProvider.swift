//
//  PreviewProvider.swift
//  Athena
//
//  Created by Lautaro Bonasora on 17/12/2023.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() {}
    
    let homeVM = BooksViewModel()
}
