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
    let greenColor: UIColor = UIColor(red: 0, green: 0.42, blue: 0, alpha: 1)
    let lightColor: UIColor = .white
    let darkColor: UIColor = UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1)
    let disabledColor: UIColor = .systemGray4
    
    let defaults = UserDefaults.standard
    
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
    
    func getBgColor() -> UIColor {
        let colorScheme = defaults.string(forKey: "colorScheme") ?? "Green"
        
        switch colorScheme {
        case "Green":
            return Constants.global.greenColor
        case "Light":
            return Constants.global.lightColor
        default:
            // "Dark"
            return Constants.global.darkColor
        }
    }
    
    
    func getTextColor() -> UIColor {
        let defaults = UserDefaults.standard
        let colorScheme = defaults.string(forKey: "colorScheme") ?? "Green"
        
        switch colorScheme {
        case "Green":
            return Constants.global.lightColor
        case "Light":
            return Constants.global.darkColor
        default:
            // "Dark"
            return Constants.global.lightColor
        }
    }
}
