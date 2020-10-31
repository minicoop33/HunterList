//
//  HunterCell.swift
//  HunterList
//
//  Created by Sage Stromberg on 10/19/20.
//  Copyright © 2020 Gluten and Ghosty. All rights reserved.
//

import UIKit

class HunterCell: UITableViewCell {
    
    var hunter: Hunter!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var totalValue: UILabel!
    @IBOutlet var isAlive: UISwitch!
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        hunter.alive = sender.isOn
        
    }
    
}
