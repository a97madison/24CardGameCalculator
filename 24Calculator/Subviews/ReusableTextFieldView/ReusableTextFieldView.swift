//
//  ReusableTextFieldView.swift
//  24Calculator
//
//  Created by The Madisons on 2021-02-01.
//

import UIKit

class ReusableTextFieldView: UIView {
    // one UILabel, one UITextField
    @IBOutlet weak var textFieldLabel: UILabel!
    @IBOutlet weak var cardValueTextField: UITextField!

    func setLabelUI(index: Int) {
        let number = index + 1
        let text = "Card #" + String(number) + " Value"
        textFieldLabel.text = text
    }
    
    func getValue() -> Int? {
        guard let input: String = cardValueTextField.text else {
            return nil
        }
        
        if (input == "J") {
            return 11
        } else if (input == "Q") {
            return 12
        } else if (input == "K") {
            return 13
        }
        
        let num = Int(input)
        return num
    }
}
