//
//  ViewController.swift
//  wand
//
//  Created by Juliette on 5/9/21.
//

import UIKit
import WandKit

class ViewController: UIViewController {
    
    override func viewDidLoad () {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Wand.shared.delegates.append(self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateState(_:)), name: NSNotification.Name(rawValue: "updateState"), object: nil)
        
        NotificationCenter.default.post(name: Notification.Name("updateState"), object: State.connecting)
    }
    
    @objc func updateState (_ notification: Notification) {
        if (notification.object != nil) {
            if let value = (notification.object as? State) {
                var viewControllerToAdd: UIViewController
                switch value {
                    case .connecting:
                        viewControllerToAdd = ConnectingViewController()
                    case .home:
                        viewControllerToAdd = HomeViewController()
                }
                // Removing children
                self.children.forEach {
                    $0.willMove(toParent: nil)
                    $0.view.removeFromSuperview()
                    $0.removeFromParent()
                }
                // Now adding the VC
                self.addSubViewController(child: viewControllerToAdd)
            }
        }
    }
}

extension ViewController : WandDelegate {
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
        let alert = UIAlertController(title: "Error!", message: "Wand disconnected! Attempting to reconnect...", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        }))
        self.present(alert, animated: true, completion: nil)
        NotificationCenter.default.post(name: Notification.Name("updateState"), object: State.connecting)
    }
    
    func location (_ point: Point) {
        return
    }
    
    func buttonPress () {
        return
    }
}
