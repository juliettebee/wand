//
//  SpellRunnerViewController.swift
//  wand
//
//  Created by Juliette on 5/13/21.
//

import Foundation
import WandKit
import UIKit

class SpellRunnerViewController : UIViewController {
    
    var doSpellRecording = false
    var starting = true
    var startingPoint: Point!
    var record: [WPoint] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Wand.shared.delegates.append(self)
    }
}

extension SpellRunnerViewController : WandDelegate {
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
        self.starting.toggle()
        self.doSpellRecording.toggle()
        self.record = []
    }
    
    func location(_ point: Point) {
        if doSpellRecording {
            if startingPoint == nil {
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
            do {
                try getAndRunSpell(record)
            } catch {
                let alert = UIAlertController(title: "Error!", message: "Failed to check spell, \(error)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                }))
                self.present(alert, animated: true, completion: nil)
            }
            print("Done")
            self.starting.toggle()
            self.doSpellRecording.toggle()
            self.record = []
            
        } else {
            self.starting.toggle()
            self.doSpellRecording.toggle()
            record = []
            print("Recording")
        }
    }
}
