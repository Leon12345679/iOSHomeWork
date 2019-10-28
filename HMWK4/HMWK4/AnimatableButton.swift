//
//  AnimatableButton.swift
//  HMWK4
//
//  Created by Leon Vladimirov on 10/28/19.
//  Copyright © 2019 Leon Vladimirov. All rights reserved.
//

import UIKit

///  UIButton subclass with a shadow, corner radius and three animations
class AnimatableButton: UIButton {

    static let animationGroupKey: String = "threeAnimations"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        castShadowAndRound(cornerRadius: self.frame.height / 2, shadowColor: .gray)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func castShadowAndRound(cornerRadius: CGFloat, shadowColor: UIColor) {
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = shadowColor.cgColor
        
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
    }
    
    
    //  pragma MARK: Transform functions
    private func createScaleZTransformAnimation() -> CABasicAnimation  {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        
        animation.duration = 0.4
        animation.toValue = Double.pi * 2
        animation.repeatCount = .greatestFiniteMagnitude
        
        return animation
    }
    
    private func createScaleXTransformAnimation() -> CABasicAnimation  {
        let animation = CABasicAnimation(keyPath: "transform.scale.x")
        
        animation.duration = 0.7
        animation.fromValue = 0.0
        animation.toValue = 1.0
        
        
        return animation
    }
    
    private func createScaleYTransformAnimation() -> CABasicAnimation  {
        let animation = CABasicAnimation(keyPath: "transform.scale.y")
        
        animation.duration = 0.7
        animation.fromValue = 0.0
        animation.toValue = 1.0
        
        return animation
    }
    
    //  pragma MARK: Animations start and deletion
    func startThreeAnimationGroup() {
        let group = CAAnimationGroup()
        group.animations = [
                    createScaleZTransformAnimation(),
                    createScaleYTransformAnimation(),
                    createScaleXTransformAnimation(),
        ]

        self.layer.add(group, forKey: AnimatableButton.animationGroupKey)
    }
    
    func stopAnimationForKey(_ key: String) {
        self.layer.removeAnimation(forKey: key)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
