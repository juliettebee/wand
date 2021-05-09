//
//  ConstraintExtension.swift
//  wand
//
//  Created by Juliette on 5/9/21.
//

import Foundation
import UIKit

extension NSLayoutAnchor {
    // Q: Why does this exist?
    // A: So constraints are pretty epic, however the method makes no sense. This exists to make it easier for me to make constraints because I can never remeber if its equalTo or isEqual, along with that, equalTo makes no sense for what its doing, same goes for constant. And I always have to do isActive so its always just going to be on for this method
    @objc func constraint (from: NSLayoutAnchor<AnchorType>, plus: CGFloat) {
        self.constraint(equalTo: from, constant: plus).isActive = true
    }
}
