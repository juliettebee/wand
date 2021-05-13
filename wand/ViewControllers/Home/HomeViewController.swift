//
//  HomeViewController.swift
//  wand
//
//  Created by Juliette on 5/9/21.
//

import Foundation
import UIKit
import WandKit

class HomeViewController : UITabBarController {
    
    override func viewDidLoad () {
        super.viewDidLoad()
        
        let spellsViewController = SpellsViewController()
        let spellRunnerViewController = SpellRunnerViewController()
        
        let spellTabBarItem = UITabBarItem()
        let spellRunnerTabBarItem = UITabBarItem()
        
        spellTabBarItem.title = "Spells"
        spellRunnerTabBarItem.title = "Run spell"
        
        spellTabBarItem.image = UIImage(systemName: "wand.and.stars")
        spellRunnerTabBarItem.image = UIImage(systemName: "wand.and.stars")
        
        spellsViewController.tabBarItem = spellTabBarItem
        spellRunnerViewController.tabBarItem = spellRunnerTabBarItem
                
        self.viewControllers = [spellsViewController, spellRunnerViewController]
                
        self.selectedViewController = spellsViewController
        self.selectedIndex = 0
    }
}
