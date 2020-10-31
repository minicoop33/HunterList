//
//  HunterStore.swift
//  HunterList
//
//  Created by Sage Stromberg on 10/19/20.
//  Copyright © 2020 Gluten and Ghosty. All rights reserved.
//

import UIKit

class HunterStore {
    
    var allHunters = [Hunter]()
    let hunterArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("hunters.plist")
    }()
    
    @discardableResult func createHunter() -> Hunter {
        let newHunter = Hunter(random: false)
        
        allHunters.append(newHunter)
        
        return newHunter
    }
    
    @objc func saveChanges() -> Bool {
        print("Saving hunters to: \(hunterArchiveURL)")
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(allHunters)
            try data.write(to: hunterArchiveURL, options: [.atomic])
            print("Saved all of the items")
            return true
        } catch let encodingError {
            print("Error encoding allHunters: \(encodingError)")
            return false
        }
    }
    
    init() {
        do {
            let data = try Data(contentsOf: hunterArchiveURL)
            let unarchiver = PropertyListDecoder()
            let hunters = try unarchiver.decode([Hunter].self, from: data)
            allHunters = hunters
        } catch {
            print("Error reading in saved hunters: \(error)")
        }
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(saveChanges), name: UIScene.didEnterBackgroundNotification, object: nil)
    }
    
    func removeHunter(_ hunter: Hunter) {
        if let index = allHunters.firstIndex(of: hunter) {
            allHunters.remove(at: index)
        }
    }
    
    func moveHunter(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        let movedHunter = allHunters[fromIndex]
        
        allHunters.remove(at: fromIndex)
        
        allHunters.insert(movedHunter, at: toIndex)
    }
    

    
}
