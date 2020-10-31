//
//  Hunter.swift
//  HunterList
//
//  Created by Sage Stromberg on 10/12/20.
//  Copyright © 2020 Gluten and Ghosty. All rights reserved.
//

import UIKit


class Hunter: Equatable, Codable {
    var name: String
    var totalValue: Int
    var hunterID: String
    var alive: Bool
    var primary: InventoryItem
    var secondary: InventoryItem
    var consumable1: InventoryItem
    var consumable2: InventoryItem
    var consumable3: InventoryItem
    var consumable4: InventoryItem
    var tool1: InventoryItem
    var tool2: InventoryItem
    var tool3: InventoryItem
    var tool4: InventoryItem
    
    static func ==(lhs: Hunter, rhs: Hunter) -> Bool {
        return lhs.hunterID == rhs.hunterID
    }

    func calculateTotalValue(hunter: Hunter) {
        hunter.totalValue = hunter.primary.price + hunter.secondary.price + hunter.consumable1.price + hunter.consumable2.price + hunter.consumable3.price + hunter.consumable4.price + hunter.tool1.price + hunter.tool2.price + hunter.tool3.price + hunter.tool4.price
    }
    
    init(name: String, primary: InventoryItem, hunterID: String, secondary: InventoryItem, consumable1: InventoryItem, consumable2: InventoryItem, consumable3: InventoryItem, consumable4: InventoryItem, tool1: InventoryItem, tool2: InventoryItem, tool3: InventoryItem, tool4: InventoryItem) {
        self.name = name
        self.hunterID = hunterID
        self.alive = true
        self.primary = primary
        self.secondary = secondary
        self.consumable1 = consumable1
        self.consumable2 = consumable2
        self.consumable3 = consumable3
        self.consumable4 = consumable4
        self.tool1 = tool1
        self.tool2 = tool2
        self.tool3 = tool3
        self.tool4 = tool4
        self.totalValue = primary.price + secondary.price + consumable1.price + consumable2.price + consumable3.price + consumable4.price + tool1.price + tool2.price + tool3.price + tool4.price
    }
    
    convenience init(random: Bool = false) {
        if random {
            let firstNames = ["Jack", "John", "Joe"]
            let lastNames = ["Cooper", "Lindsey", "Mac"]

            let randomFirst = firstNames.randomElement()!
            let randomLast = lastNames.randomElement()!
            let randomName = "\(randomFirst) \(randomLast)"
            
            let randomID = UUID().uuidString.components(separatedBy: "-").first!
            
            let newPrimary = InventoryItem()
            let newSecondary = InventoryItem()
            let newConsumable1 = InventoryItem()
            let newConsumable2 = InventoryItem()
            let newConsumable3 = InventoryItem()
            let newConsumable4 = InventoryItem()
            let newTool1 = InventoryItem()
            let newTool2 = InventoryItem()
            let newTool3 = InventoryItem()
            let newTool4 = InventoryItem()
            
            self.init(name: randomName, primary: newPrimary, hunterID: randomID, secondary: newSecondary, consumable1: newConsumable1, consumable2: newConsumable2, consumable3: newConsumable3, consumable4: newConsumable4, tool1: newTool1, tool2: newTool2, tool3: newTool3, tool4: newTool4)



        } else {
            let newPrimary = InventoryItem()
            let newSecondary = InventoryItem()
            let newConsumable1 = InventoryItem()
            let newConsumable2 = InventoryItem()
            let newConsumable3 = InventoryItem()
            let newConsumable4 = InventoryItem()
            let newTool1 = InventoryItem()
            let newTool2 = InventoryItem()
            let newTool3 = InventoryItem()
            let newTool4 = InventoryItem()
            let randomID = UUID().uuidString.components(separatedBy: "-").first!
            
            self.init(name: "New Hunter", primary: newPrimary, hunterID: randomID, secondary: newSecondary, consumable1: newConsumable1, consumable2: newConsumable2, consumable3: newConsumable3, consumable4: newConsumable4, tool1: newTool1, tool2: newTool2, tool3: newTool3, tool4: newTool4)
        }
    }
}




