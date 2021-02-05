//
//  ViewController.swift
//  24Calculator
//
//  Created by The Madisons on 2021-01-26.
//

enum CalculatorType {
    case TwentyFour;
    case TwentySomething;
}

import UIKit

//enum CalculatorType {
//    case TwentyFour; case TwentySomething
//}

class ViewController: UIViewController {
    // three UIViews
    @IBOutlet weak var headerSectionView: UIView!
    @IBOutlet weak var inputsSectionView: UIView!
    @IBOutlet weak var solutionsSectionView: UIView!
    
    // header section views:
    // three ReusableButtonViews,
    // one 24CalculatorTypeButton
    
    // inputs section views:
    // one TargetTextFieldView
    @IBOutlet weak var targetTextField: TargetTextFieldView!
    // four ReusableTextFieldView
    @IBOutlet weak var card1TextField: ReusableTextFieldView!
    @IBOutlet weak var card2TextxField: ReusableTextFieldView!
    @IBOutlet weak var card3TextField: ReusableTextFieldView!
    @IBOutlet weak var card4TextField: ReusableTextFieldView!
    // two ReusableButtonViews
    @IBOutlet weak var resetButton: ReusableButtonView!
    @IBOutlet weak var calculateSolutionsButton: ReusableButtonView!
    
    // solution section views:
    // one label
    // one ReusableButtonView
    // one tableView
    
    var calculatorType: CalculatorType = CalculatorType.TwentyFour
    var targetText = "18"
    
    var targetNum: Int?
    var card1Num: Int?
    var card2Num: Int?
    var card3Num: Int?
    var card4Num: Int?

    func setNumVariables() {
//        targetNum = getValidTargetValue(value: targetValue.text)
//        card1Num = getValidCardValue(value: card1Value.text)
//        card2Num = getValidCardValue(value: card2Value.text)
//        card3Num = getValidCardValue(value: card3Value.text)
//        card4Num = getValidCardValue(value: card4Value.text)
    }

    func shouldEnableCalculateButtonHelper() -> Bool {
        return ((targetNum != nil) &&
                (card1Num != nil) &&
                (card2Num != nil) &&
                (card3Num != nil) &&
                (card4Num != nil))
    }

    func setupLabelText() {
        // inputs section label text
        card1TextField.setLabelUI(index: 0)
        card2TextxField.setLabelUI(index: 1)
        card3TextField.setLabelUI(index: 2)
        card4TextField.setLabelUI(index: 3)
        resetButton.setButtonUI(text: "RESET", fontSize: 12)
        calculateSolutionsButton.setButtonUI(text: "CALCULATE SOLUTIONS", fontSize: 20) // maybe set font size to 32.
        
        // solutions section label text
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // setup target text field default text anything else settings related
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupLabelText()

        // set local number variables
        setNumVariables()

        // should Calculate Solutions be enabled
        let shouldEnableCalculateButton: Bool = shouldEnableCalculateButtonHelper()
        // calculateButton.isEnabled = shouldEnableCalculateButton
        
        // input section views setup
        // based on calculator type, toggle targetTextFieldView UI if necessary
        let showTwentySomethingCalculator = (calculatorType == CalculatorType.TwentySomething)
        if (showTwentySomethingCalculator == targetTextField.targetTextField.isHidden) {
            targetTextField.updateUI()
        }
    }

    // put this in its own file
    @IBAction func calculateAllSolutionsButton(_ sender: Any) {
        
    }
}

