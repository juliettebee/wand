//
//  UIViewExtensions.swift
//  wand
//
//  Created by Juliette on 5/9/21.
//

import Foundation
import UIKit

extension UIView {
    func removeAllSubviews () {
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
    }
}
