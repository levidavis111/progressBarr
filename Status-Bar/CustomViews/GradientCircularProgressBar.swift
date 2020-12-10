//
//  GradientCircularProgressBar.swift
//  Status-Bar
//
//  Created by Levi Davis on 12/10/20.
//

import UIKit

@IBDesignable
class GradientCircularProgressBar: UIView {
    @IBInspectable var color: UIColor = .gray {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var gradientColor: UIColor = .white {
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
    private let gradientLayer = CAGradientLayer()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
        createAnimation()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayers()
        createAnimation()
    }
    
    override func draw(_ rect: CGRect) {
        let circlePath = UIBezierPath(ovalIn: rect.insetBy(dx: ringWidth / 2, dy: ringWidth / 2))
        backgroundMask.path = circlePath.cgPath
       
//        layer.mask = backgroundMask
        
        progressLayer.path = circlePath.cgPath
        progressLayer.lineCap = .round
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = progress
        progressLayer.strokeColor = UIColor.black.cgColor
        
        gradientLayer.frame = rect
        gradientLayer.colors = [color.cgColor, gradientColor.cgColor, color.cgColor]
    }

    private func setupLayers() {
        backgroundMask.lineWidth = ringWidth
        backgroundMask.fillColor = nil
        backgroundMask.strokeColor = UIColor.black.cgColor
        layer.mask = backgroundMask
        
        progressLayer.lineWidth = ringWidth
        progressLayer.fillColor = nil
        
        layer.addSublayer(gradientLayer)
        layer.transform = CATransform3DMakeRotation(CGFloat(90 * Double.pi / 180), 0, 0, -1)
        
        gradientLayer.mask = progressLayer
        gradientLayer.locations = [0.35, 0.5, 0.65]
    }
    
    private func createAnimation() {
        let startPointAnimation = CAKeyframeAnimation(keyPath: "startPoint")
        startPointAnimation.values = [CGPoint.zero, CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1)]
        
        startPointAnimation.isRemovedOnCompletion = false
        startPointAnimation.repeatCount = Float.infinity
        startPointAnimation.duration = 1
        
        let endPointAnimation = CAKeyframeAnimation(keyPath: "endPoint")
        endPointAnimation.values = [CGPoint(x: 1, y: 1), CGPoint(x: 0, y: 1), CGPoint.zero]
        
        endPointAnimation.isRemovedOnCompletion = false
        endPointAnimation.repeatCount = Float.infinity
        endPointAnimation.duration = 1
        
        gradientLayer.add(startPointAnimation, forKey: "startPointAnimation")
        gradientLayer.add(endPointAnimation, forKey: "endPointAnimation")
    }
}


/**
 import Foundation
 import UIKit

 @IBDesignable
 class GradientCircularProgressBar: UIView {
     @IBInspectable var color: UIColor = .gray {
         didSet { setNeedsDisplay() }
     }
     @IBInspectable var gradientColor: UIColor = .white {
         didSet { setNeedsDisplay() }
     }
     @IBInspectable var ringWidth: CGFloat = 5

     var progress: CGFloat = 0 {
         didSet { setNeedsDisplay() }
     }

     private var progressLayer = CAShapeLayer()
     private var backgroundMask = CAShapeLayer()
     private let gradientLayer = CAGradientLayer()

     override init(frame: CGRect) {
         super.init(frame: frame)
         setupLayers()
         createAnimation()
     }

     required init?(coder: NSCoder) {
         super.init(coder: coder)
         setupLayers()
         createAnimation()
     }

     private func setupLayers() {
         backgroundMask.lineWidth = ringWidth
         backgroundMask.fillColor = nil
         backgroundMask.strokeColor = UIColor.black.cgColor
         layer.mask = backgroundMask

         progressLayer.lineWidth = ringWidth
         progressLayer.fillColor = nil

         layer.addSublayer(gradientLayer)
         layer.transform = CATransform3DMakeRotation(CGFloat(90 * Double.pi / 180), 0, 0, -1)

         gradientLayer.mask = progressLayer
         gradientLayer.locations = [0.35, 0.5, 0.65]
     }

     private func createAnimation() {
         let startPointAnimation = CAKeyframeAnimation(keyPath: "startPoint")
         startPointAnimation.values = [CGPoint.zero, CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1)]

         startPointAnimation.repeatCount = Float.infinity
         startPointAnimation.duration = 1

         let endPointAnimation = CAKeyframeAnimation(keyPath: "endPoint")
         endPointAnimation.values = [CGPoint(x: 1, y: 1), CGPoint(x: 0, y: 1), CGPoint.zero]

         endPointAnimation.repeatCount = Float.infinity
         endPointAnimation.duration = 1

         gradientLayer.add(startPointAnimation, forKey: "startPointAnimation")
         gradientLayer.add(endPointAnimation, forKey: "endPointAnimation")
     }

     override func draw(_ rect: CGRect) {
         let circlePath = UIBezierPath(ovalIn: rect.insetBy(dx: ringWidth / 2, dy: ringWidth / 2))
         backgroundMask.path = circlePath.cgPath

         progressLayer.path = circlePath.cgPath
         progressLayer.lineCap = .round
         progressLayer.strokeStart = 0
         progressLayer.strokeEnd = progress
         progressLayer.strokeColor = UIColor.black.cgColor

         gradientLayer.frame = rect
         gradientLayer.colors = [color.cgColor, gradientColor.cgColor, color.cgColor]
     }
 }
 */
