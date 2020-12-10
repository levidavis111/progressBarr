//
//  SecondViewController.swift
//  Status-Bar
//
//  Created by Levi Davis on 12/10/20.
//

import UIKit

class SecondViewController: UIViewController {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "hand.thumbsup.fill")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        createImageView()
    }
    
    private func createImageView() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        [imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
         imageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
         imageView.heightAnchor.constraint(equalToConstant: 250),
         imageView.widthAnchor.constraint(equalToConstant: 250)].forEach {$0.isActive = true}
    }
}
