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
    
    func setupLabelStyle(label: UILabel) {
        let font = UIFont(name: "Nunito-Regular", size: 32)
        label.font = font
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
    }
    
    func setupTextFieldStyle(textField: UITextField) {
        textField.layer.cornerRadius = 5.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.white.cgColor
    }
    
    func setupButtonStyle(button: UIButton) {
//        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5.0
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.white.cgColor
    }
    
    func clearTextField(textField: UITextField) {
        textField.text = ""
    }
}
