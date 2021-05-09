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
    var input: UITextField!
    var recording = false
    var record : [Point] = []
    var page = 0
    var spell = Spell(points: [], url: NSURL.init())
    
    override func viewDidLoad () {
        super.viewDidLoad()
        
        Wand.shared.delegates.append(self)
        
        label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.text = "Press the button on the wand to get started"
        label.sizeToFit()
        
        self.view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.widthAnchor.constraint(from: self.view.widthAnchor, plus: 0)
        label.heightAnchor.constraint(from: self.view.heightAnchor, plus: 0)
        label.center = self.view.center
    }
    
    func nextPage () {
        page += 1
        
        self.view.removeAllSubviews()
        
        switch page {
            // Page 0 is setup on load so we don't need to do anything
            case 1:
                // Get url to post to
                input = UITextField()
                input.placeholder = "URL to POST to. Press wand button to continue"
                self.view.addSubview(input)
                
                input.translatesAutoresizingMaskIntoConstraints = false
                
                input.widthAnchor.constraint(from: self.view.widthAnchor, plus: 0)
                input.heightAnchor.constraint(from: self.view.heightAnchor, plus: 0)
                input.leftAnchor.constraint(from: self.view.leftAnchor, plus: 0)
                input.centerXAnchor.constraint(from: self.view.centerXAnchor, plus: 0)
            case 2:
                getURL()
            default:
                break
        }
    }
    
    func getURL () {
        if self.input.text != nil {
            if let url = NSURL.init(string: self.input.text!) {
                spell.url = url
                spell.save()
                return
            }
        }
        let alert = UIAlertController(title: "Error!", message: "Please put a valid URL!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        }))
        self.present(alert, animated: true, completion: nil)
        page = page - 2
        nextPage()
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
            record.append(point)
        }
    }
    
    func buttonPress () {
        if recording {
            spell.points = record
            label.text = "Got it, moving on"
            nextPage()
        } else {
            label.text = "Press again to end recording"
            recording = true
        }
    }
}
