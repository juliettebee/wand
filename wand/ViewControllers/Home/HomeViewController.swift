//
//  HomeViewController.swift
//  wand
//
//  Created by Juliette on 5/9/21.
//

import Foundation
import UIKit

class HomeViewController : UITabBarController {
    
    override func viewDidLoad () {
        super.viewDidLoad()
        
        let spellsViewController = SpellsViewController()
        let spellTabBarItem = UITabBarItem()
        spellTabBarItem.title = "Spells"
        spellTabBarItem.image = UIImage(systemName: "wand.and.stars")
        spellsViewController.tabBarItem = spellTabBarItem
                
        self.viewControllers = [spellsViewController]
                
        self.selectedViewController = spellsViewController
        self.selectedIndex = 1
    }
}
