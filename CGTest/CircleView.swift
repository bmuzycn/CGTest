//
//  CircleView.swift
//  CGTest
//
//  Created by Yu Zhang on 11/11/19.
//  Copyright © 2019 Yu Zhang. All rights reserved.
//

import UIKit
class RadialCircleView: UIView {
    override func draw(_ rect: CGRect) {
        let thickness: CGFloat = 20
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = min(bounds.width, bounds.height) / 2 - thickness / 2
        var last: CGFloat = 0
        for a in 1...360 {
            let ang = CGFloat(a) / 180 * .pi
            let arc = UIBezierPath(arcCenter: center, radius: radius, startAngle: last, endAngle: ang, clockwise: true)
            arc.lineWidth = thickness
            last = ang
            UIColor(hue: CGFloat(a) / 360, saturation: 1, brightness: 1, alpha: 1).set()
            arc.stroke()
        }
    }
}

