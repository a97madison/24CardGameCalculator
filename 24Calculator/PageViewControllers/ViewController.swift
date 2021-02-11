//
//  ViewController.swift
//  24Calculator
//
//  Created by The Madisons on 2021-01-26.
//
//
//enum CalculatorType {
//    case TwentyFour;
//    case TwentySomething;
//}
//
//enum ColorScheme {
//    case Green;
//    case Dark;
//    case Light;
//}

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var mainView: UIView!
    
    // three UIViews
    @IBOutlet weak var headerSectionView: UIView!
    @IBOutlet weak var inputsSectionView: UIView!
    @IBOutlet weak var solutionsSectionView: UIView!
    
    // header section views:
    // three ReusableButtonViews,
    @IBOutlet weak var tutorialButtonView: ReusableButtonView!
    @IBOutlet weak var informationButtonView: ReusableButtonView!
    @IBOutlet weak var calculatorTypeButton: ReusableButtonView!
    // one normal button
    @IBOutlet weak var colorSchemeButton: UIButton!
    
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
    // one UITextView
    @IBOutlet weak var solutionsTextView: UITextView!
    // one ReusableButtonView
    @IBOutlet weak var showSolutionsButton: ReusableButtonView!
    // one UITableView
    @IBOutlet weak var solutionsTableView: UITableView!
    
    // tooltip view:
    @IBOutlet weak var tooltipView: TooltipView!
    
    let defaults = UserDefaults.standard
    var targetText = "18"
    var solutionsList: [String] = []
    
    var num1: Int = 0
    var num2: Int = 0
    var num3: Int = 0
    var num4: Int = 0
    
    private func getCalculatorType() -> CalculatorType {
        let typeString = defaults.string(forKey: "calculatorType") ?? "TwentyFour"
        let type: CalculatorType = typeString == "TwentyFour" ? CalculatorType.TwentyFour : CalculatorType.TwentySomething
        return type
    }
    
    func setupBackgroundColor() {
        // setup main view background color
        let color = Constants.global.getBgColor()
        mainView.backgroundColor = color
//        colorSchemeButton.backgroundColor = color
        // setup textfield views text/border color
        // setup target view text/border color
        // setup button views text/border color
        // setup tooltip text color
    }
    
    func setupUIText() {
        // inputs section label text
        card1TextField.setLabelUI(index: 0)
        card2TextField.setLabelUI(index: 1)
        card3TextField.setLabelUI(index: 2)
        card4TextField.setLabelUI(index: 3)
        card1TextField.setEnableDisableButtonsHandler(handler: self.enableDisableInputSectionButton)
        card2TextField.setEnableDisableButtonsHandler(handler: self.enableDisableInputSectionButton)
        card3TextField.setEnableDisableButtonsHandler(handler: self.enableDisableInputSectionButton)
        card4TextField.setEnableDisableButtonsHandler(handler: self.enableDisableInputSectionButton)
        targetTextField.setEnableDisableButtonsHandler(handler: self.enableDisableInputSectionButton)
        
        tutorialButtonView.setButtonUI(text: "TUTORIAL", fontSize: 12)
        informationButtonView.setButtonUI(text: "INFO", fontSize: 12)
        resetButton.setButtonUI(text: "RESET", fontSize: 12)
        calculateSolutionsButton.setButtonUI(text: "CALCULATE SOLUTIONS", fontSize: 20)
        showSolutionsButton.setButtonUI(text: "SHOW SOLUTIONS", fontSize: 20)
        // solutions section label text
    }
    
    func setupTargetView() {
        // input section target view setup based on calculatorType value
        let calculatorType: CalculatorType = getCalculatorType()
        let showTwentySomethingCalculator = (calculatorType == CalculatorType.TwentySomething)
        if (showTwentySomethingCalculator == targetTextField.targetTextField.isHidden) {
            targetTextField.updateUI()
        }
    }
    
    func enableDisableInputSectionButton() {
        let isEnabled = (targetTextField.isValidTargetTextField() &&
                            card1TextField.isValidCardValue() &&
                            card2TextField.isValidCardValue() &&
                            card3TextField.isValidCardValue() &&
                            card4TextField.isValidCardValue())
        calculateSolutionsButton.setIsEnabled(isEnabled: isEnabled)
    }
    
    func setupColorSchemeButton() {
        let color = Constants.global.getBgColor()
        let borderColor = UIColor.black
        colorSchemeButton.backgroundColor = color
        colorSchemeButton.layer.borderWidth = 2.0
        colorSchemeButton.layer.cornerRadius = 0.5 * colorSchemeButton.bounds.width
        colorSchemeButton.clipsToBounds = true
        colorSchemeButton.layer.borderColor = borderColor.cgColor
        colorSchemeButton.setBackgroundColor(color, for: .normal)
    }
    
    func setupCalculatorTypeButton() {
        let calculatorType: CalculatorType = getCalculatorType()
        let text = calculatorType == CalculatorType.TwentyFour ? "Twenty Four" : "Twenty Something"
        calculatorTypeButton.setButtonUI(text: text, fontSize: 12.0)
    }
    
    func setupSolutionsTextViewColor() {
        let color = Constants.global.getTextColor()
        solutionsTextView.textColor = color
    }
    
    func setupSolutionsTableViewBorder() {
        let color = Constants.global.getTextColor()
        solutionsTableView.layer.borderWidth = 1.0
        solutionsTableView.layer.borderColor = color.cgColor
        solutionsTableView.layer.cornerRadius = 2.5
        solutionsTableView.clipsToBounds = true
//        solutionsTableView.layer.border
    }
    
    func resetButtonHandler() {
        targetTextField.resetTextField()
         
        card1TextField.clearTextField()
        card2TextField.clearTextField()
        card3TextField.clearTextField()
        card4TextField.clearTextField()
        
        self.solutionsSectionView.isHidden = true
        self.solutionsTableView.isHidden = true
        
        self.enableDisableInputSectionButton()
    }
    
    func setSolutionsTextViewText(n1: Double, n2: Double, n3: Double, n4: Double, target: Int) {
        let n1str = String(Int(n1))
        let n2str = String(Int(n2))
        let n3str = String(Int(n3))
        let n4str = String(Int(n4))
        let numSolutions = String(self.solutionsList.count)
        let solutionsStr = (numSolutions == "1" ? " solution for " : " solutions for ")
        let targetStr = String(target)
        
        let res = n1str + ", " + n2str + ", " + n3str + " and " + n4str + " have " + numSolutions + solutionsStr + targetStr + "."
        
        self.solutionsTextView.text = res
    }
    
    func calculateSolutionsHandler() {
        // calculate solutions, update text view, update table view
        num1 = card1TextField.getValue()!
        num2 = card2TextField.getValue()!
        num3 = card3TextField.getValue()!
        num4 = card4TextField.getValue()!
        let n1 = Double(num1)
        let n2 = Double(num2)
        let n3 = Double(num3)
        let n4 = Double(num4)
        let target = targetTextField.getTargetValue(n4: num4)!
        let calculateSolutions = CalculateSolutions()
        solutionsList = calculateSolutions.findSolutions(n1: n1, n2: n2, n3: n3, n4: n4, target: target)
        setSolutionsTextViewText(n1: n1,n2: n2,n3: n3,n4: n4,target: target)
        
        showSolutionsButton.isHidden = (solutionsList.count == 0)
        solutionsTableView.isHidden = true
        solutionsSectionView.isHidden = false
    }
    
    func clickCalculatorTypeHandler() {
        let calculatorType: CalculatorType = getCalculatorType()
        let newCalculatorTypeString = calculatorType == CalculatorType.TwentyFour ? "TwentySomething" : "TwentyFour"
        defaults.setValue(newCalculatorTypeString, forKey: "calculatorType")
        self.setupCalculatorTypeButton()
        self.setupTargetView()
//        self.mainView.setNeedsDisplay()
    }
    
    func navToTutorialPageHandler() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let tutorialVC = storyBoard.instantiateViewController(withIdentifier: "tutorialViewController") as! TutorialViewController
        tutorialVC.modalPresentationStyle = .fullScreen
        tutorialVC.navigationController?.isNavigationBarHidden = false
//        tutorialVC.navigationControl
        self.present(tutorialVC, animated: true, completion: nil)
    }
    
    func navToInfoPageHandler() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let infoVC = storyBoard.instantiateViewController(withIdentifier: "infoViewController") as! InfoViewController
        infoVC.modalPresentationStyle = .fullScreen
        infoVC.navigationController?.isNavigationBarHidden = false
        self.present(infoVC, animated: true, completion: nil)

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
    
    func showSolutionsHandler() {
        solutionsTableView.reloadData()
        solutionsTableView.isHidden = false
    }
    
    func setupButtonHandlers() {
        calculatorTypeButton.setButtonBehaviour(handler: clickCalculatorTypeHandler, showToolTipHandler: showTooltipHandler)
        tutorialButtonView.setButtonBehaviour(handler: navToTutorialPageHandler, showToolTipHandler: showTooltipHandler)
        informationButtonView.setButtonBehaviour(handler: navToInfoPageHandler, showToolTipHandler: showTooltipHandler)
        resetButton.setButtonBehaviour(handler: resetButtonHandler, showToolTipHandler: showTooltipHandler)
        calculateSolutionsButton.setButtonBehaviour(handler: calculateSolutionsHandler, showToolTipHandler: showTooltipHandler)
        showSolutionsButton.setButtonBehaviour(handler: showSolutionsHandler, showToolTipHandler: showTooltipHandler)
    }
        
//    func setupColors() {
////        var bgColor: UIColor
////        var textColor: UIColor
////        if (colorScheme == ColorScheme.Green) {
////            bgColor = .green
////            textColor = .white
////        } else if (colorScheme == ColorScheme.Dark) {
////            bgColor = .systemGray
////            textColor = .white
////        } else if (colorScheme == ColorScheme.Light) {
////            bgColor = .white
////            textColor = .systemGray
////        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.solutionsTableView.delegate = self
        self.solutionsTableView
            .dataSource = self
        SingleSolutionTableViewCell.registerCellXib(with: solutionsTableView)
//        self.solutionsTableView.numberOfSections = 1
        
        setupBackgroundColor()
        setNeedsStatusBarAppearanceUpdate()
        setupColorSchemeButton()
        setupCalculatorTypeButton()
        setupUIText()
        setupTargetView()
        enableDisableInputSectionButton()
        setupButtonHandlers()
        setupSolutionsTextViewColor()
        setupSolutionsTableViewBorder()

    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        Constants.global.getBgColor() == Constants.global.lightColor ? .darkContent : .lightContent
    }
    
    @IBAction func colorSchemeButtonClicked(_ sender: Any) {
        let color = Constants.global.getBgColor()
        var newColorScheme: String
        switch color {
        case Constants.global.greenColor:
            newColorScheme = "Dark"
            break
        case Constants.global.lightColor:
            newColorScheme = "Green"
            break
        default:
            // Constants.global.darkColor
            newColorScheme = "Light"
        }
        
        defaults.setValue(newColorScheme, forKey: "colorScheme")
        
        tutorialButtonView.initHelper()
        calculatorTypeButton.initHelper()
        informationButtonView.initHelper()
        targetTextField.initHelper()
        card1TextField.initHelper()
        card2TextField.initHelper()
        card3TextField.initHelper()
        card4TextField.initHelper()
        resetButton.initHelper()
        tooltipView.initHelper()
        showSolutionsButton.initHelper()
        calculateSolutionsButton.initHelper()
        setupBackgroundColor()
        setNeedsStatusBarAppearanceUpdate()
        setupColorSchemeButton()
        setupSolutionsTextViewColor()
        setupSolutionsTableViewBorder()
        solutionsTableView.reloadData()
//        setupUIText()
//        self.viewDidLoad()
//        self.mainView.setNeedsDisplay()
    }
    
    // MARK: UITableView methods
//    func configureTableView() {
//        solutionsTableView.rowHeight = UITableView.automaticDimension
//        solutionsTableView.estimatedRowHeight = 30
//    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.solutionsList.count
    }
    
//    let cellId = "SingleSolutionTableViewCell"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SingleSolutionTableViewCell.storyboardID) as! SingleSolutionTableViewCell
        let expression = self.solutionsList[indexPath.row]
        let targetStr = String(targetTextField.getTargetValue(n4: num4)!)
        cell.initHelper()
        cell.setupSolution(expression: expression, target: targetStr)
       return cell
    }
    
    //MARK: TableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
//        table
    }
}

extension UIButton {
    // https://stackoverflow.com/questions/14523348/how-to-change-the-background-color-of-a-uibutton-while-its-highlighted
    private func image(withColor color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()

        context?.setFillColor(color.cgColor)
        context?.fill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }

    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        self.setBackgroundImage(image(withColor: color), for: state)
    }
}
