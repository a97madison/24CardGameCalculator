//
//  TooltipView.swift
//  24Calculator
//
//  Created by The Madisons on 2021-02-09.
//

import UIKit

class TooltipView: NibLoadingView {
    // one UITextView
    @IBOutlet weak var popupTextView: UITextView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initHelper()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initHelper()
    }
    
    func initHelper() {
        self.setupTextViewStyle(textView: popupTextView)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
