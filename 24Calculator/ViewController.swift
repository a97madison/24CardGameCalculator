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
    @IBOutlet weak var card2TextField: ReusableTextFieldView!
    @IBOutlet weak var card3TextField: ReusableTextFieldView!
    @IBOutlet weak var card4TextField: ReusableTextFieldView!
    // two ReusableButtonViews
    @IBOutlet weak var resetButton: ReusableButtonView!
    @IBOutlet weak var calculateSolutionsButton: ReusableButtonView!
    
    // solution section views:
    // one label
    // one ReusableButtonView
    // one tableView
    
    // tooltip view:
    @IBOutlet weak var tooltipView: TooltipView!
    
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

    func setupUIText() {
        // inputs section label text
        card1TextField.setLabelUI(index: 0)
        card2TextField.setLabelUI(index: 1)
        card3TextField.setLabelUI(index: 2)
        card4TextField.setLabelUI(index: 3)
        card1TextField.setEnableDisableButtonsHandler(handler: self.enableDisableButtons)
        card2TextField.setEnableDisableButtonsHandler(handler: self.enableDisableButtons)
        card3TextField.setEnableDisableButtonsHandler(handler: self.enableDisableButtons)
        card4TextField.setEnableDisableButtonsHandler(handler: self.enableDisableButtons)
        
        resetButton.setButtonUI(text: "RESET", fontSize: 12)
        calculateSolutionsButton.setButtonUI(text: "CALCULATE SOLUTIONS", fontSize: 20)
        
        // solutions section label text
    }
    
    func resetButtonHandler() {
        targetTextField.resetTextField()
         
        card1TextField.clearTextField()
        card2TextField.clearTextField()
        card3TextField.clearTextField()
        card4TextField.clearTextField()
        
        self.enableDisableButtons()
    }
    
    func calculateSolutionsHandler() {
        
    }
    
    func showTooltipHandler() {
        self.tooltipView.isHidden = false
        self.calculateSolutionsButton.button.isEnabled = false
        UIView.animate(withDuration: 1, delay: 3, options: UIView.AnimationOptions.transitionFlipFromTop, animations: {
            self.tooltipView.alpha = 0
        }, completion: { finished in
            self.tooltipView.isHidden = true
            self.calculateSolutionsButton.button.isEnabled = true
            self.tooltipView.alpha = 1
        })
    }
    
    func setupButtonHandlers() {
        resetButton.setButtonBehaviour(handler: resetButtonHandler, showToolTipHandler: showTooltipHandler)
        calculateSolutionsButton.setButtonBehaviour(handler: calculateSolutionsHandler, showToolTipHandler: showTooltipHandler)
    }
    
    func enableDisableButtons() {
        let isEnabled = (targetTextField.isValidTargetTextField() &&
                            card1TextField.isValidCardValue() &&
                            card2TextField.isValidCardValue() &&
                            card3TextField.isValidCardValue() &&
                            card4TextField.isValidCardValue())
        calculateSolutionsButton.setIsEnabled(isEnabled: isEnabled)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
        setupUIText()
        setupButtonHandlers()
        enableDisableButtons()
        
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

