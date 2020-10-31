//
//  InventoryItem.swift
//  HunterList
//
//  Created by Sage Stromberg on 10/12/20.
//  Copyright © 2020 Gluten and Ghosty. All rights reserved.
//

import UIKit

class InventoryItem: Equatable, Codable {
    static func == (lhs: InventoryItem, rhs: InventoryItem) -> Bool {
        return lhs.name == rhs.name && lhs.price == rhs.price
    }
    
    var name: String
    var price: Int
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    
    convenience init() {
        self.init(name: "", price: 0)
    }
    
}
