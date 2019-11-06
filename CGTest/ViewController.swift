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
        let testView = CGTestView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        testView.angle = 120
        testView.radius = 75
        view.addSubview(testView)
        testView.center = view.center
        // Do any additional setup after loading the view, typically from a nib.
    }


}

