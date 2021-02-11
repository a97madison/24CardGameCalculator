//
//  TargetTextFieldView.swift
//  24Calculator
//
//  Created by The Madisons on 2021-01-30.
//

import UIKit

class TargetTextFieldView: NibLoadingView {
    // three UILabels, one UITextField
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var twentyFourLabel: UILabel!
    @IBOutlet weak var equationLabel: UILabel!
    @IBOutlet weak var targetTextField: UITextField!
    
    var enableDisableButtonsHandler: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initHelper()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initHelper()
    }
    
    func initHelper() {
        setupLabelStyle(label: targetLabel)
        setupLabelStyle(label: equationLabel)
        setupTextFieldStyle(textField: targetTextField)
    }
    
    func updateUI() {
        twentyFourLabel.isHidden = !twentyFourLabel.isHidden
        targetTextField.isHidden = !targetTextField.isHidden
        equationLabel.isHidden = !equationLabel.isHidden
        initHelper()
    }
    
    func resetTextField() {
        targetTextField.text = "18"
        setupTextFieldStyle(textField: targetTextField)
    }
    
    func setEnableDisableButtonsHandler(handler: @escaping () -> ()) {
        enableDisableButtonsHandler = handler
    }
    
    func getTargetTextFieldValue() -> Int? {
        guard var input = targetTextField.text else {
            return nil
        }

        while (input[0] == " ") {
            input = input.substring(fromIndex: 1)
        }
        
        let num = Int(input)
        return num
    }
    
    func getTargetValue(n4: Int) -> Int? {
        guard twentyFourLabel.isHidden else {
            return 24
        }
        
        guard let num = getTargetTextFieldValue() else {
            return nil
        }
        
        let targetValue: Int = num + n4
        return targetValue
    }
    
    func isValidTargetTextField() -> Bool {
        guard twentyFourLabel.isHidden else {
            return true
        }
        
        guard let targetValue = getTargetTextFieldValue() else {
            return false
        }
        
        return (targetValue >= 0 && targetValue <= 99)
    }

    @IBAction func userChangedTargetTextField(_ sender: Any) {
        if (isValidTargetTextField()) {
            setupTextFieldColor(textField: targetTextField)
        } else {
            setupTextFieldColor(textField: targetTextField, isDisabled: true)
        }
        
        self.enableDisableButtonsHandler!()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
