//
//  ViewController.swift
//  CGTest
//
//  Created by Yu Zhang on 11/4/19.
//  Copyright © 2019 Yu Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let testView = GradientArcView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        testView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(testView)
        testView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        testView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        testView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        testView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        // Do any additional setup after loading the view, typically from a nib.
        
//        let radial = RadialCircleView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//        radial.backgroundColor = UIColor(red: 0.98, green: 0.92, blue: 0.84, alpha: 1) // "antique white"
//        radial.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(radial)
//        radial.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        radial.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        radial.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        radial.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }


}

