//
//  SingleSolutionTableViewCell.swift
//  24Calculator
//
//  Created by The Madisons on 2021-02-11.
//

import UIKit

class SingleSolutionTableViewCell: UITableViewCell {
    @IBOutlet weak var equationLabel: UILabel!
    @IBOutlet weak var equalLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initHelper()
        // Initialization code
    }
    
    func initHelper() {
        setupLabelColor(label: equationLabel)
        setupLabelColor(label: equalLabel)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupLabelColor(label: UILabel, isDisabled: Bool = false) {
        let color = isDisabled ? Constants.global.disabledColor :  Constants.global.getTextColor()
        label.textColor = color
    }
    
    private func setupLabelStyle(label: UILabel) {
        let font = UIFont(name: "Nunito-Regular", size: 32)
        label.font = font
        label.adjustsFontSizeToFitWidth = true
        setupLabelColor(label: label)
    }

    
    func setupSolution(expression: String, target: String) {
        equationLabel.text = expression
        targetLabel.text = target
    }
    
}

//MARK: - UItableView Extension
extension UITableViewCell {
// Not using static as it wont be possible to override to provide custom storyboardID then
class var storyboardID : String {
    return "\(self)"
  }

static func registerCellXib(with tableview: UITableView){
    let nib = UINib(nibName: self.storyboardID, bundle: nil)
    tableview.register(nib, forCellReuseIdentifier: self.storyboardID)
  }
}
