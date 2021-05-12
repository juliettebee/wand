//
//  SpellsTableViewController.swift
//  wand
//
//  Created by Juliette on 5/9/21.
//

import Foundation
import UIKit

class SpellsTableViewController : UITableViewController {
    
    var spells: [Spell]! = []
    
    override func viewDidLoad () {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonAction(_:)))
        
        // load data
        do {
            spells = try loadSpells()
        } catch {
            let alert = UIAlertController(title: "Error!", message: "Failed to load data, \(error)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            }))
            self.present(alert, animated: true, completion: nil)
        }
        // TODO: load data onto table
    }
    
    @objc func addButtonAction (_ sender: UIButton) {
        self.navigationController?.pushViewController(SpellCreatorViewController(), animated: false)
    }
}
