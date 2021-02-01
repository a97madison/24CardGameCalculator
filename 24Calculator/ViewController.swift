//
//  ViewController.swift
//  24Calculator
//
//  Created by The Madisons on 2021-01-26.
//

import UIKit

//enum CalculatorType {
//    case TwentyFour; case TwentySomething
//}

class ViewController: UIViewController {

    @IBOutlet weak var targetValue: UITextField!
    @IBOutlet weak var card1Value: UITextField!
    @IBOutlet weak var card2Value: UITextField!
    @IBOutlet weak var card3Value: UITextField!
    @IBOutlet weak var card4Value: UITextField!
    @IBOutlet weak var calculateButton: UIButton!

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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // set classes number variables
        setNumVariables()

        // should Calculate Solutions be enabled
        let shouldEnableCalculateButton: Bool = shouldEnableCalculateButtonHelper()
        calculateButton.isEnabled = shouldEnableCalculateButton
    }

    // put this in its own file
    @IBAction func calculateAllSolutionsButton(_ sender: Any) {
        
    }
}

