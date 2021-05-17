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
        tableLoadSpells()
    }
    
    func tableLoadSpells () {
        do {
            spells = try loadSpells()
        } catch {
            let alert = UIAlertController(title: "Error!", message: "Failed to load data, \(error)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableLoadSpells()
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.spells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = self.spells[indexPath.row].url
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete", handler: { [weak self](action, view, completionHandler) in
            self?.deleteCell(index: indexPath)
            completionHandler(true)
        })
        
        action.image = UIImage(systemName: "trash")
        action.backgroundColor = UIColor.red
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func deleteCell (index: IndexPath) {
        do {
            try deleteSpell(spell: self.spells[index.item])
        } catch {
            let alert = UIAlertController(title: "Error!", message: "Failed to delete spell, \(error)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            }))
            self.present(alert, animated: true, completion: nil)
            return
        }
        self.spells.remove(at: index.item)
        
        self.tableView.deleteRows(at: [index], with: .fade)
    }
    
    @objc func addButtonAction (_ sender: UIButton) {
        self.navigationController?.pushViewController(SpellCreatorViewController(), animated: false)
    }
}
