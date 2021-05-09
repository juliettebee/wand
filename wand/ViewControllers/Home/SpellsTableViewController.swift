//
//  SpellsTableViewController.swift
//  wand
//
//  Created by Juliette on 5/9/21.
//

import Foundation
import UIKit

class SpellsTableViewController : UIViewController {
    
    override func viewDidLoad () {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonAction(_:)))
    }
    
    @objc func addButtonAction (_ sender: UIButton) {
        self.navigationController?.pushViewController(SpellCreatorViewController(), animated: false)
    }
}
