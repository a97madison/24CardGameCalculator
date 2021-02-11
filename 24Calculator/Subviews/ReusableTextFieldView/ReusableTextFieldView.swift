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
    
    var enableDisableButtonsHandler: (() -> ())?
    
    var fontSize: CGFloat = 32
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initHelper()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initHelper()
    }
    
    func initHelper() {
//        self.setupTextFieldStyle(textField: cardValueTextField)
        self.setupTextFieldStyle(textField: cardValueTextField)
        self.clearTextField()
        self.setupLabelStyle(label: textFieldLabel)
        self.setupLabelColor(label: indexLabel)
    }
    
    func setEnableDisableButtonsHandler(handler: @escaping () -> ()) {
        enableDisableButtonsHandler = handler
    }
    
    func setLabelText(text: String) {
        textFieldLabel.text = text
        setupLabelStyle(label: textFieldLabel)
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
    
    func clearTextField() {
        self.clearTextField(textField: cardValueTextField)
    }
    
    func getValue() -> Int? {
        guard var input: String = cardValueTextField.text else {
            return nil
        }
        
        while (input[0] == " ") {
            input = input.substring(fromIndex: 1)
        }
        
        if (input == "A") {
            return 1
        } else if (input == "J") {
            return 11
        } else if (input == "Q") {
            return 12
        } else if (input == "K") {
            return 13
        }
        
        let num = Int(input)
        return num
    }
    
    func isValidCardValue() -> Bool {
        guard let cardNum = getValue() else {
            return false
        }
        return (cardNum >= 1 && cardNum <= 13)
    }
    
    @IBAction func userChangedTextField(_ sender: Any) {
        if (isValidCardValue()) {
            setupTextFieldColor(textField: cardValueTextField)
        } else {
            setupTextFieldColor(textField: cardValueTextField, isDisabled: true)
        }
        
        self.enableDisableButtonsHandler!()
    }
}

// String extension added/tested2
extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
