//
//  ViewController.swift
//  Status-Bar
//
//  Created by Levi Davis on 12/10/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var plainHorizontalProgressBarOutlet: PlainHorizontalProgressBar!
    @IBOutlet weak var plainCircularProgessBarOutlet: PlainCircularProgressBar!
    @IBOutlet weak var gradientHorizontalProgressBarOutlest: GradientHorizontalProgressBar!
    @IBOutlet weak var horizontalSliderOutlet: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }

    @IBAction func horizontalSliderDidMove(_ sender: UISlider) {
        plainHorizontalProgressBarOutlet.progress = CGFloat(sender.value)
        plainCircularProgessBarOutlet.progress = CGFloat(sender.value)
        gradientHorizontalProgressBarOutlest.progress = CGFloat(sender.value)
    }
    
}

