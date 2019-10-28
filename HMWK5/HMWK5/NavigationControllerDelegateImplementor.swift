//
//  NavigationControllerDelegateImplementor.swift
//  HMWK5
//
//  Created by Leon Vladimirov on 10/28/19.
//  Copyright © 2019 Leon Vladimirov. All rights reserved.
//

import UIKit

class NavigationControllerDelegateImplementor: NSObject, UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                                animationControllerFor operation: UINavigationController.Operation,
                                from fromVC: UIViewController,
                                to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        return OpacityTransition()
    }
}

class OpacityTransition: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(exactly: 0.7)!
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let src = transitionContext.viewController(forKey: .from),
            let dst = transitionContext.viewController(forKey: .to)
        else {return}

        let container = transitionContext.containerView


        let duration = transitionDuration(using: transitionContext)

        dst.view.alpha = 0.0
        src.view.alpha = 1.0
        dst.view.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        
        container.backgroundColor = src.view.backgroundColor
        
        container.addSubview(dst.view)
        
        UIView.animate(withDuration: duration, animations: {
            dst.view.alpha = 1.0
            dst.view.transform = .identity
            
            src.view.alpha = 0.0

        }) { _ in
            src.view.alpha = 1.0
            src.view.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)

        }
    }
}
