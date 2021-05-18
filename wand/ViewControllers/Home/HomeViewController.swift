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
        let settingsViewController = SettingsViewController()
        
        let spellTabBarItem = UITabBarItem()
        let spellRunnerTabBarItem = UITabBarItem()
        let settingsTabBarItem = UITabBarItem()
        
        spellTabBarItem.title = "Spells"
        spellRunnerTabBarItem.title = "Run spell"
        settingsTabBarItem.title = "Settings"
        
        spellTabBarItem.image = UIImage(systemName: "list.bullet")
        spellRunnerTabBarItem.image = UIImage(systemName: "wand.and.stars")
        settingsTabBarItem.image = UIImage(systemName: "gear")
        
        spellsViewController.tabBarItem = spellTabBarItem
        spellRunnerViewController.tabBarItem = spellRunnerTabBarItem
        settingsViewController.tabBarItem = settingsTabBarItem
                
        self.viewControllers = [spellsViewController, spellRunnerViewController, settingsViewController]
                
        self.selectedViewController = spellsViewController
        self.selectedIndex = 0
    }
}
