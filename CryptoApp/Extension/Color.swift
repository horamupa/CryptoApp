//
//  Color.swift
//  CryptoApp
//
//  Created by MM on 13.09.2022.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let background = Color("BackgroundColor")
    let secondaryText = Color("SecondaryTextColor")
}
