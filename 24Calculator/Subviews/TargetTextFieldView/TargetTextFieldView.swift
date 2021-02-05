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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabelStyle(label: targetLabel)
        setupLabelStyle(label: equationLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLabelStyle(label: targetLabel)
        setupLabelStyle(label: equationLabel)
    }
    
    func updateUI() {
        twentyFourLabel.isHidden = !twentyFourLabel.isHidden
        targetTextField.isHidden = !targetTextField.isHidden
        equationLabel.isHidden = !equationLabel.isHidden
    }
    
    func getTargetValue(n4: Int) -> Int? {
        guard twentyFourLabel.isHidden else {
            return 24
        }

        guard let num = Int(targetTextField.text ?? "") else {
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
