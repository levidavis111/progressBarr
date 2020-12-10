//
//  PlainHorizontalProgressBar.swift
//  Status-Bar
//
//  Created by Levi Davis on 12/10/20.
//

import UIKit

@IBDesignable
class PlainHorizontalProgressBar: UIView {
    @IBInspectable var color: UIColor? = .gray {
        didSet {
            setNeedsDisplay()
        }
    }
    var progress: CGFloat = 0.5 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private let progressLayer = CALayer()
    private let backgroundMask = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayers()
    }
    
    override func draw(_ rect: CGRect) {
        backgroundMask.path = UIBezierPath(roundedRect: rect, cornerRadius: rect.height * 0.25).cgPath
        layer.mask = backgroundMask
        
        let progressRect = CGRect(origin: .zero, size: CGSize(width: rect.width * progress, height: rect.height))
        progressLayer.frame = progressRect
        
        layer.addSublayer(progressLayer)
        progressLayer.backgroundColor = color?.cgColor
    }

    private func setupLayers() {
        layer.addSublayer(progressLayer)
    }
    
}
