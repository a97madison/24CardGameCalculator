//
//  NibLoadingView.swift
//  24Calculator
//
//  Created by The Madisons on 2021-02-06.
//

import UIKit

@IBDesignable
class NibLoadingView: UIView {

    @IBOutlet weak var view: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }

    private func nibSetup() {
        backgroundColor = .clear

        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true

        addSubview(view)
    }

    private func loadViewFromNib() -> UIView {
        let viewType = type(of: self)
        let bundle = Bundle(for: viewType)
        let nibName: String =  String(describing: viewType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return nibView
    }
    
    func setupLabelColor(label: UILabel, isDisabled: Bool = false) {
        let color = isDisabled ? Constants.global.disabledColor :  Constants.global.getTextColor()
        label.textColor = color
    }
    
    func setupTextFieldColor(textField: UITextField, isDisabled: Bool = false) {
        let color = isDisabled ? Constants.global.disabledColor :  Constants.global.getTextColor()
        textField.textColor = color
    }
    
    func setupLabelStyle(label: UILabel) {
        let font = UIFont(name: "Nunito-Regular", size: 32)
        label.font = font
        label.adjustsFontSizeToFitWidth = true
        setupLabelColor(label: label)
    }
    
    func setupTextViewStyle(textView: UITextView) {
        let color = Constants.global.getTextColor()
        
        textView.layer.cornerRadius = 5.0
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = color.cgColor
        textView.textColor = color
    }
    
    func setupTextFieldStyle(textField: UITextField) {
        let color = Constants.global.getTextColor()
        
        textField.layer.cornerRadius = 5.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = color.cgColor
        textField.textColor = color
        textField.tintColor = color
    }
    
    func setupButtonStyle(button: UIButton) {
        let color = Constants.global.getTextColor()
        
        button.setTitleColor(color, for: .normal)
        button.layer.cornerRadius = 5.0
        button.layer.borderWidth = 1.0
        button.layer.borderColor = color.cgColor
    }
    
    func clearTextField(textField: UITextField) {
        textField.text = ""
    }
}
