//
//  TargetTextFieldView.swift
//  24Calculator
//
//  Created by The Madisons on 2021-01-30.
//

import UIKit

class TargetTextFieldView: UIView {
    // three UILabels, one UITextField
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var twentyFourLabel: UILabel!
    @IBOutlet weak var equationLabel: UILabel!
    @IBOutlet weak var targetTextField: UITextField!
    
    func updateUI() {
        twentyFourLabel.isHidden = !twentyFourLabel.isHidden
        targetTextField.isHidden = !targetTextField.isHidden
        equationLabel.isHidden = !equationLabel.isHidden
    }
    
    func getTargetValue(n4: Int) -> Int? {
        guard twentyFourLabel.isHidden else {
            return 24
        }

        guard let input: String = targetTextField.text && num = Int(input) else {
            return nil
        }

        let targetValue: Int = num + n4
        return targetValue
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
