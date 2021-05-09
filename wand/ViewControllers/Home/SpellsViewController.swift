//
//  SpellsViewController.swift
//  wand
//
//  Created by Juliette on 5/9/21.
//

import Foundation
import UIKit

class SpellsViewController : UINavigationController {
    
    override func viewDidLoad () {
        super.viewDidLoad()
        
        self.pushViewController(SpellsTableViewController(), animated: true)
    }
}
