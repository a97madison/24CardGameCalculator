//
//  InfoViewController.swift
//  24Calculator
//
//  Created by The Madisons on 2021-02-10.
//

import UIKit

class InfoViewController: UIViewController {
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var backButton: UIButton!
    
    func setupColors() {
        let color = Constants.global.getBgColor()
        let textColor = Constants.global.getTextColor()
        mainView.backgroundColor = color
        backButton.setTitleColor(textColor, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupColors()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        Constants.global.getBgColor() == Constants.global.lightColor ? .darkContent : .lightContent
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
