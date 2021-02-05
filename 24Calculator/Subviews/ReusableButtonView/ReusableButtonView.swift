//
//  ReusableButtonView.swift
//  24Calculator
//
//  Created by The Madisons on 2021-02-06.
//

import UIKit

class ReusableButtonView: NibLoadingView {
    // one UIButton
    @IBOutlet weak var button: UIButton!
    
    var handler: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupButtonStyle(button: button)
    }

    required init?(coder aDecoder: NSCoder) {
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
        
        super.init(coder: aDecoder)
        self.setupButtonStyle(button: button)
    }
    
//    func setupButtonStyle(button: UIButton) {
//        button.setTitleColor(.white, for: .normal)
//    }
    
    func setButtonUI(text: String, fontSize: CGFloat) {
        button.setTitle(text, for: .normal)
        let font = UIFont(name: "Nunito-Bold", size: fontSize)
        button.titleLabel!.font = font
        button.titleLabel!.adjustsFontForContentSizeCategory = true
        self.setNeedsDisplay()
    }
    
    func setButtonBehaviour(handler: @escaping () -> ()) {
        self.handler = handler
    }
    
    
    @IBAction func buttonClicked(_ sender: Any) {
        self.handler?()
    }
}
