//
//  Color.swift
//  Athena
//
//  Created by Lautaro Bonasora on 17/12/2023.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("bgColor")
    let columbiaBlue = Color("columbiaBlue")
    let celadon = Color("celadon")
    let frenchBlue = Color("frenchBlue")
    let raisinBlack = Color("raisinBlack")
}
