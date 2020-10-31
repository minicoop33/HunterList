//
//  HuntersViewController.swift
//  HunterList
//
//  Created by Sage Stromberg on 10/18/20.
//  Copyright © 2020 Gluten and Ghosty. All rights reserved.
//

import UIKit

class HuntersViewController: UITableViewController {
    
    var hunterStore: HunterStore!
    
    @IBAction func addNewHunter(_ sender: UIBarButtonItem) {
        let newHunter = hunterStore.createHunter()
        
        if let index = hunterStore.allHunters.firstIndex(of: newHunter) {
            let indexPath = IndexPath(row: index, section: 0)
            
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showHunter":
            if let row = tableView.indexPathForSelectedRow?.row {
                let hunter = hunterStore.allHunters[row]
                let detailViewController = segue.destination as! DetailViewController
                
                detailViewController.hunter = hunter
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hunterStore.allHunters.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HunterCell", for: indexPath) as! HunterCell
        
        let hunter = hunterStore.allHunters[indexPath.row]
        
        cell.nameLabel.text = hunter.name
        cell.totalValue.text = "$\(hunter.totalValue)"
        cell.hunter = hunter
        
        if hunter.alive {
            cell.isAlive.setOn(true, animated: true)
        } else {
            cell.isAlive.setOn(false, animated: true)
        }
        
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let hunter = hunterStore.allHunters[indexPath.row]
            
            hunterStore.removeHunter(hunter)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        hunterStore.moveHunter(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
}
