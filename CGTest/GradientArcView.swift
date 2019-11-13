//
//  GradientView.swift
//  CGTest
//
//  Created by Yu Zhang on 11/11/19.
//  Copyright © 2019 Yu Zhang. All rights reserved.
//
import UIKit

@IBDesignable
class GradientArcView: UIView {
    @IBInspectable var startColor: UIColor = .green { didSet { setNeedsLayout() } }
    @IBInspectable var midColor: UIColor = .yellow { didSet { setNeedsLayout() } }
    @IBInspectable var endColor:   UIColor = .red  { didSet { setNeedsLayout() } }
    @IBInspectable var lineWidth:  CGFloat = 50      { didSet { setNeedsLayout() } }
    
    private let gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = .conic
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        return gradientLayer
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configure()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateGradient()
    }
}

private extension GradientArcView {
    func configure() {
        layer.addSublayer(gradientLayer)
    }
    
    func updateGradient() {
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.white, startColor, midColor, endColor, UIColor.black].map { $0.cgColor }
        gradientLayer.locations = [0,0.2,0.4,0.6,0.8]
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = (min(bounds.width, bounds.height) - lineWidth) / 2
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: -.pi, endAngle: 0, clockwise: true)
        let mask = CAShapeLayer()
        mask.fillColor = UIColor.clear.cgColor
        mask.strokeColor = UIColor.white.cgColor
        mask.lineWidth = lineWidth
        mask.path = path.cgPath
        gradientLayer.mask = mask
    }
}
