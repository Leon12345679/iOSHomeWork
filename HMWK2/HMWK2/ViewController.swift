//
//  ViewController.swift
//  HMWK2
//
//  Created by Leon Vladimirov on 10/8/19.
//  Copyright © 2019 Leon Vladimirov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            
        Storage.write(50, forKey: "integer")
        let result = Storage<Int>.read(value: "integer")
        
        switch result {
        case .success(let value):
            print(value)
        case .failure(let readError):
            print(readError.localizedDescription)
        }
        // Do any additional setup after loading the view.
    }
    

}

