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
    
    @IBOutlet weak var horizontalSliderOutlet: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    @IBAction func horizontalSliderDidMove(_ sender: UISlider) {
        plainHorizontalProgressBarOutlet.progress = CGFloat(sender.value)
    }
    
}

