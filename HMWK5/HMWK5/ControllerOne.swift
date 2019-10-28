//
//  ViewController.swift
//  HMWK5
//
//  Created by Leon Vladimirov on 10/28/19.
//  Copyright © 2019 Leon Vladimirov. All rights reserved.
//

import UIKit

class ControllerOne: UIViewController {

    var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        button = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 200, height: 50)))
        button.center = view.center
        
        button.setTitle("move to new controller", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        button.addTarget(self, action: #selector(moveToNewController), for: .touchUpInside)
        
        view.addSubview(button)
        // Do any additional setup after loading the view.
    }

    @objc
    func moveToNewController() {
        let dst = ControllerTwo()
            
        let navigationControllerDelegate = NavigationControllerDelegateImplementor()
        self.navigationController?.delegate = navigationControllerDelegate
        
        self.navigationController?.pushViewController(dst, animated: true)
    }

}

