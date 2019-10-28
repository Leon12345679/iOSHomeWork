//
//  ViewController.swift
//  HMWK4
//
//  Created by Leon Vladimirov on 10/28/19.
//  Copyright © 2019 Leon Vladimirov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let coolButton = AnimatableButton(frame: CGRect(x: self.view.center.x - 100,
                                                        y: self.view.center.y - 50,
                                                        width: 200,
                                                        height: 100))
        coolButton.setTitle("Tap me!", for: .normal)
        coolButton.setTitleColor(.black, for: .normal)
        coolButton.addTarget(self, action: #selector(animateCoolButton), for: .touchUpInside)
        
        
        view.backgroundColor = .white
        view.addSubview(coolButton)
                
        // Do any additional setup after loading the view.
    }

    @objc
    func animateCoolButton(_ sender: AnimatableButton) {
        sender.startThreeAnimationGroup()
    }
}

