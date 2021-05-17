//
//  SettingsViewController.swift
//  wand
//
//  Created by Juliette on 5/17/21.
//

import Foundation
import UIKit
import WandKit

class SettingsViewController : UIViewController {
    
    var defaults: UserDefaults!
    var input: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        Wand.shared.delegates.append(self)
        
        defaults = UserDefaults()
        
        input = UITextField()
        input.placeholder = "Max score, click wand to dismiss"
        input.text! = String(defaults.integer(forKey: "maxScore"))
        input.keyboardType = .numberPad
        input.addAction(UIAction(title: "Done") { (action) in
            self.defaults.setValue(Int(self.input.text ?? "30"), forKey: "maxScore")
            print("save")
        }, for: .editingChanged)
        
        
        self.view.addSubview(input)
        
        input.translatesAutoresizingMaskIntoConstraints = false
        input.widthAnchor.constraint(from: self.view.widthAnchor, plus: 0)
        input.heightAnchor.constraint(from: self.view.heightAnchor, plus: 0)
        input.leftAnchor.constraint(from: self.view.leftAnchor, plus: 0)
    }
}

extension SettingsViewController : WandDelegate {
    func deviceFound() {
        return
    }
    
    func connected() {
        return
    }
    
    func failToConnect() {
        return
    }
    
    func disconnect() {
        return
    }
    
    func location(_ point: Point) {
        return
    }
    
    func buttonPress() {
        input.resignFirstResponder()
    }
    
    
}
