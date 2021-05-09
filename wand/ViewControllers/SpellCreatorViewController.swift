//
//  SpellCreatorViewController.swift
//  wand
//
//  Created by Juliette on 5/9/21.
//

import Foundation
import UIKit
import WandKit

class SpellCreatorViewController : UIViewController {
    
    var label: UILabel!
    var recording = false
    
    override func viewDidLoad () {
        super.viewDidLoad()
        
        Wand.shared.delegates.append(self)
        
        label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.text = "Press the button on the wand to get started"
        label.sizeToFit()
        
        self.view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.widthAnchor.constraint(from: self.view.widthAnchor, plus: 0)
        label.heightAnchor.constraint(from: self.view.heightAnchor, plus: 0)
        label.center = self.view.center
    }
}

extension SpellCreatorViewController : WandDelegate {
    func deviceFound () {
        return
    }
    
    func connected () {
        return
    }
    
    func failToConnect () {
        return
    }
    
    func disconnect () {
        return
    }
    
    func location (_ point: Point) {
        if recording {
            
        }
    }
    
    func buttonPress () {
        if recording {
            label.text = "Got it, moving on"
        } else {
            label.text = "Press again to end recording"
            recording = true
        }
    }
}
