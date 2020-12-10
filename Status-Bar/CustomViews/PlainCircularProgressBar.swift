//
//  PlainCircularProgressBar.swift
//  Status-Bar
//
//  Created by Levi Davis on 12/10/20.
//

import UIKit

@IBDesignable
class PlainCircularProgressBar: UIView {
    @IBInspectable var color: UIColor? = .gray {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var ringWidth: CGFloat = 15.0
    
    var progress: CGFloat = 0.5 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private let progressLayer = CAShapeLayer()
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
        let circlePath = UIBezierPath(ovalIn: rect.insetBy(dx: ringWidth / 2, dy: ringWidth / 2))
        backgroundMask.path = circlePath.cgPath
       
        layer.mask = backgroundMask
        
        progressLayer.path = circlePath.cgPath
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = progress
        progressLayer.strokeColor = color?.cgColor
    }

    private func setupLayers() {
        backgroundMask.lineWidth = ringWidth
        backgroundMask.fillColor = nil
        backgroundMask.strokeColor = UIColor.black.cgColor
        
        progressLayer.lineWidth = ringWidth
        progressLayer.fillColor = nil
        
        layer.addSublayer(progressLayer)
        layer.transform = CATransform3DMakeRotation(CGFloat(90 * Double.pi / 180), 0, 0, -1)
    }
    
}
