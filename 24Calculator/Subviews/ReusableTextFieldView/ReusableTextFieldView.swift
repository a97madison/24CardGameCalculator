//
//  ReusableTextFieldView.swift
//  24Calculator
//
//  Created by The Madisons on 2021-02-01.
//

import UIKit

class ReusableTextFieldView: NibLoadingView {
    // two UILabels, one UITextField
    @IBOutlet weak var textFieldLabel: UILabel!
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var cardValueTextField: UITextField!
    
    var fontSize: CGFloat = 32
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLabelStyle(label: textFieldLabel)
        self.setupTextFieldStyle(textField: cardValueTextField)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupLabelStyle(label: textFieldLabel)
        self.setupTextFieldStyle(textField: cardValueTextField)
    }
    
    func setLabelText(text: String) {
        let font = UIFont(name: "Nunito-Regular.ttf", size: fontSize)
        textFieldLabel.font = font
        textFieldLabel.textColor = .white
        textFieldLabel.adjustsFontSizeToFitWidth = true
        textFieldLabel.text = text
    }
    
    func setLabelUI(index: Int) {
        var numLabel: String = ""
        switch index {
        case 0:
            numLabel = "①"
            break
        case 1:
            numLabel = "②"
            break
        case 2:
            numLabel = "③"
            break
        case 3:
            numLabel = "④"
            break
        default:
            break
        }
        indexLabel.text = numLabel
     
        let number = index + 1
        let label = "Card #" + String(number) + " Value: "
        setLabelText(text: label)
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
