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
    
    var doSpellRecording = true
    var starting = true
    var startingPoint: Point!
    var record: [WPoint] = []
    
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(toggleSpellRecording(_:)), name: NSNotification.Name(rawValue: "toggleSpellRecording"), object: nil)
        
        Wand.shared.delegates.append(self)
    }
    
    @objc func toggleSpellRecording (_ notification: Notification) {
        self.doSpellRecording.toggle()
    }
}

extension HomeViewController : WandDelegate {
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
        if doSpellRecording {
            if starting {
                self.startingPoint = point
                self.starting = false
                return
            }
            
            let newX = Int(point.x) - Int(startingPoint.x)
            let newY = Int(point.y) - Int(startingPoint.y)
            
            record.append(WPoint(x: newX, y: newY))
        }
    }
    
    func buttonPress() {
        if doSpellRecording {
            getAndRunSpell(record)
            print("Done")
            print(record)
        } else {
            print("Begin recording")
        }
        
        self.starting.toggle()
        self.doSpellRecording.toggle()
        record = []
    }
}
