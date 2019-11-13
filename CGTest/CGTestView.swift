//
//  CGTestView.swift
//  CGTest
//
//  Created by Yu Zhang on 11/4/19.
//  Copyright © 2019 Yu Zhang. All rights reserved.
//

import UIKit

class CGTestView: UIView {
    var path = UIBezierPath()
    
    var angle: Int = 0
    
    var radius: CGFloat = 0 {
        willSet {
            drawCircle(radius: newValue)
            drawArm(length: newValue - 10, angle: angle)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawCircle(radius: CGFloat) {
        let circleLayer = CAShapeLayer()
//        let center = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat.pi*2, clockwise: true)
        circleLayer.path = path.cgPath
        circleLayer.lineWidth = 20
        circleLayer.strokeColor = UIColor.red.cgColor
        circleLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(circleLayer)
        drawGradient(mask: circleLayer)
    }
    
    func drawArm(length: CGFloat, angle: Int) {
        let radian = degreeToRadian(degree: angle)
        let lineLayer = CAShapeLayer()
        let linePath = CGMutablePath()
        let startPoint = self.center
        let endPoint = CGPoint(x: center.x - length, y: center.y)
        linePath.move(to: startPoint)
        linePath.addLine(to: endPoint)
        lineLayer.path = linePath
        lineLayer.lineWidth = 3
        lineLayer.strokeColor = UIColor.blue.cgColor
        lineLayer.bounds = self.bounds
        layer.addSublayer(lineLayer)
        
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.isCumulative = true
        animation.repeatCount = 0
        animation.toValue = radian
        animation.duration = 2
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        lineLayer.add(animation, forKey: "ratate")
    }
    
    func degreeToRadian(degree: Int) -> CGFloat {
        return CGFloat(degree) * CGFloat.pi / 180
    }
    
    func drawGradient(mask: CAShapeLayer) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = .axial
        gradientLayer.colors = [UIColor.green, .yellow, .red, .purple].map{$0.cgColor}
        gradientLayer.bounds = path.bounds
        
        gradientLayer.mask = mask
        layer.addSublayer(gradientLayer)

    }
    
}

