//
//  Constants.swift
//  24Calculator
//
//  Created by The Madisons on 2021-02-01.
//

import UIKit

class Constants {
    static let global = Global()
}

class Global {
    let nunitoFont: UIFont
    
    init() {
        nunitoFont = UIFont(name: "Nunito-Bold", size: UIFont.labelFontSize) ?? UIFont()
        guard nunitoFont != UIFont() else {
            fatalError("""
                Failed to load the "Nunito-Regular" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
    }
}
