//
//  ConnectingViewController.swift
//  wand
//
//  Created by Juliette on 5/9/21.
//

import Foundation
import UIKit
import WandKit

class ConnectingViewController : UIViewController {

    var label: UILabel!
    
    override func viewDidLoad () {
        super.viewDidLoad()
        
        Wand.shared.delegates.append(self)
        
        label = UILabel.init()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.text = "🔎 Searching"
        label.sizeToFit()
        
        self.view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.widthAnchor.constraint(from: self.view.widthAnchor, plus: 0)
        label.heightAnchor.constraint(from: self.view.heightAnchor, plus: 0)
        label.center = self.view.center
    }
}

extension ConnectingViewController : WandDelegate {
    func deviceFound () {
        label.text = "📌 Found wand"
        label.sizeToFit()
    }
    
    func connected () {
        label.text = "✅ Connected to wand"
        label.sizeToFit()
        NotificationCenter.default.post(name: Notification.Name("updateState"), object: State.home)
    }
    
    func failToConnect () {
        label.text = "❌ Failed to connect, trying again"
        label.sizeToFit()
    }
    
    func disconnect () {
        label.text = "🔎 Searching"
        label.sizeToFit()
    }
    
    func location (_ point: Point) {
        return
    }
    
    func buttonPress () {
        return
    }
}
