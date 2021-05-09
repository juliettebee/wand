//
//  UIViewControllerExtensions.swift
//  wand
//
//  Created by Juliette on 5/9/21.
//

import Foundation
import UIKit

extension UIViewController {
    func addSubViewController (child: UIViewController) {
        view.addSubview(child.view)
        addChild(child)
        child.didMove(toParent: self)
    }
}
