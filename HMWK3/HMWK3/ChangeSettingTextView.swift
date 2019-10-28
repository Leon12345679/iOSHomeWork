//
//  ChangeSettingTextView.swift
//  HMWK3
//
//  Created by Leon Vladimirov on 10/28/19.
//  Copyright © 2019 Leon Vladimirov. All rights reserved.
//

import UIKit

class ChangeSettingTextView: UITextView, UITextViewDelegate {
    var textViewPlaceholder: String = "Enter text"
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        delegate = self
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
        
        self.text = textViewPlaceholder
        self.textColor = .gray

    }
    
    func setPlaceholder(_ placeholder: String) {
        self.text = placeholder
        
        self.textViewPlaceholder = placeholder
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textViewPlaceholder {
            self.text = ""
        }
        
        self.textColor = .black
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            self.text = textViewPlaceholder
            self.textColor = .gray
        }
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
