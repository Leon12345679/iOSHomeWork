//
//  ViewController.swift
//  HMWK3
//
//  Created by Leon Vladimirov on 10/28/19.
//  Copyright © 2019 Leon Vladimirov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var controllerTitle: String?
    var dataSourceDelegate: DataSourceChange?
    var parentPath: IndexPath!
    
    var textView: ChangeSettingTextView!
    var doneButton: UIButton = UIButton()
    
    private let textViewPlaceholder: String = "Please enter new setting title"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if controllerTitle != nil {
            self.title = controllerTitle
        }
        
//      pragma MARK: textView Positioning
        textView = ChangeSettingTextView(frame: CGRect(origin: CGPoint(x: 0, y: 0),
                                                       size: CGSize(width: view.frame.width - 20,
                                                                    height: view.frame.height / 4)))
        textView.center = view.center
        
//      pragma MARK: textView Setup
        textView.setPlaceholder(textViewPlaceholder)

        
//      pragma MARK: doneButton Positioning
        doneButton.frame = CGRect(origin: CGPoint(x: 0, y: 0),
                                  size: CGSize(width: textView.frame.width,
                                               height: 50))
        doneButton.center.x = view.center.x
        doneButton.center.y = view.center.y - (textView.frame.height / 2 + doneButton.frame.height + 10) // height + margin
        
//      pragma MARK: doneButton Setup
        doneButton.layer.cornerRadius = 10
        doneButton.setTitle("Confirm new title", for: .normal)
        doneButton.backgroundColor = .lightGray
        doneButton.addTarget(self, action: #selector(changeSettingTitle), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
//      pragma MARK: Main View Setup and subview setup
        view.backgroundColor = .white
        
        view.addSubview(textView)
        view.addSubview(doneButton)
        
        doneButton.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @objc
    func changeSettingTitle() {
        if let newTitle = textView.text {
            self.title = newTitle
            
            dataSourceDelegate?.updateDataSource(dataPath: parentPath, newVal: newTitle)
            UIButton.animate(withDuration: 0.2, animations: {
                self.doneButton.alpha = 0.0
            }) { _ in
                
                self.doneButton.isHidden = true
                self.doneButton.alpha = 1.0
            }
        }
    }
    
    @objc
    func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        let tapPoint = sender.location(in: view)
        
//      Dismiss if tapped outside of textField
        if !textView.frame.contains(tapPoint) && textView.isFirstResponder {
            textView.resignFirstResponder()
            
//          If there is text and it's not a placeholder - promt user to confirm change
//          Checking formatted string count vs text.isEmpty since spaces matter here
            if textView.text.replacingOccurrences(of: "", with: " ").count != 0 && textView.text != textView.textViewPlaceholder {
                if self.doneButton.isHidden {
                    self.doneButton.alpha = 0.0
                    self.doneButton.isHidden = false
                    UIButton.animate(withDuration: 0.2) {
                        self.doneButton.alpha = 1.0
                    }
                }
            }
        }
    }

}
