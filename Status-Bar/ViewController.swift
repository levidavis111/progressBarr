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
    @IBOutlet weak var gradientCircularProgressBarOutlet: GradientCircularProgressBar!
    @IBOutlet weak var rotatingCircularGradientProgressBarOutlet: RotatingCircularGradientProgressBar!
    
    @IBOutlet weak var horizontalSliderOutlet: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        rotatingCircularGradientProgressBarOutlet.progress = CGFloat(horizontalSliderOutlet.value)
    }

    @IBAction func horizontalSliderDidMove(_ sender: UISlider) {
        plainHorizontalProgressBarOutlet.progress = CGFloat(sender.value)
        plainCircularProgessBarOutlet.progress = CGFloat(sender.value)
        gradientHorizontalProgressBarOutlest.progress = CGFloat(sender.value)
        gradientCircularProgressBarOutlet.progress = CGFloat(sender.value)
        rotatingCircularGradientProgressBarOutlet.progress = CGFloat(sender.value)
    }
    
    private func transitionWithAnimation() {
        
    }
}

