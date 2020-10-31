//
//  DetailViewController.swift
//  HunterList
//
//  Created by Sage Stromberg on 10/21/20.
//  Copyright © 2020 Gluten and Ghosty. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return primaryData.count
        } else if pickerView.tag == 2 {
            return secondaryData.count
        }else if pickerView.tag == 3 {
            return toolData.count
        }else if pickerView.tag == 4 {
            return toolData.count
        }else if pickerView.tag == 5 {
            return toolData.count
        }else if pickerView.tag == 6 {
            return toolData.count
        }else if pickerView.tag == 7 {
            return consumableData.count
        }else if pickerView.tag == 8 {
            return consumableData.count
        }else if pickerView.tag == 9 {
            return consumableData.count
        } else {
            return consumableData.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            var returnString = primaryData[row].name + " - $" + String(primaryData[row].price)
            if primaryData[row].name == "" {
                returnString = "Empty"
            }
            return returnString
        } else if pickerView.tag == 2 {
            var returnString = secondaryData[row].name + " - $" + String(secondaryData[row].price)
            if secondaryData[row].name == "" {
                returnString = "Empty"
            }
            return returnString
        }else if pickerView.tag == 3 {
            var returnString = toolData[row].name + " - $" + String(toolData[row].price)
            if toolData[row].name == "" {
                returnString = "Empty"
            }
            return returnString
        }else if pickerView.tag == 4 {
            var returnString = toolData[row].name + " - $" + String(toolData[row].price)
            if toolData[row].name == "" {
                returnString = "Empty"
            }
            return returnString
        }else if pickerView.tag == 5 {
            var returnString = toolData[row].name + " - $" + String(toolData[row].price)
            if toolData[row].name == "" {
                returnString = "Empty"
            }
            return returnString
        }else if pickerView.tag == 6 {
            var returnString = toolData[row].name + " - $" + String(toolData[row].price)
            if toolData[row].name == "" {
                returnString = "Empty"
            }
            return returnString
        }else {
            var returnString = consumableData[row].name + " - $" + String(consumableData[row].price)
            if consumableData[row].name == "" {
                returnString = "Empty"
            }
            return returnString
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    

    @IBOutlet var nameField: UITextField!
    @IBOutlet var isAliveField: UILabel!
    @IBOutlet var primaryField: UIPickerView!
    @IBOutlet var secondaryField: UIPickerView!
    @IBOutlet var tool1Field: UIPickerView!
    @IBOutlet var tool2Field: UIPickerView!
    @IBOutlet var tool3Field: UIPickerView!
    @IBOutlet var tool4Field: UIPickerView!
    @IBOutlet var consumable1Field: UIPickerView!
    @IBOutlet var consumable2Field: UIPickerView!
    @IBOutlet var consumable3Field: UIPickerView!
    @IBOutlet var consumable4Field: UIPickerView!
    
    var primaryData: [InventoryItem] = [InventoryItem]()
    var secondaryData: [InventoryItem] = [InventoryItem]()
    var toolData: [InventoryItem] = [InventoryItem]()
    var consumableData: [InventoryItem] = [InventoryItem]()
    
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    var hunter: Hunter! {
        didSet {
            navigationItem.title = hunter.name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.primaryField.delegate = self
        self.primaryField.dataSource = self
        self.secondaryField.delegate = self
        self.secondaryField.dataSource = self
        self.tool1Field.delegate = self
        self.tool1Field.dataSource = self
        self.tool2Field.delegate = self
        self.tool2Field.dataSource = self
        self.tool3Field.delegate = self
        self.tool3Field.dataSource = self
        self.tool4Field.delegate = self
        self.tool4Field.dataSource = self
        self.consumable1Field.delegate = self
        self.consumable1Field.dataSource = self
        self.consumable2Field.delegate = self
        self.consumable2Field.dataSource = self
        self.consumable3Field.delegate = self
        self.consumable3Field.dataSource = self
        self.consumable4Field.delegate = self
        self.consumable4Field.dataSource = self
        
        
        primaryData = [InventoryItem(), InventoryItem(name: "Mosin", price: 490), InventoryItem(name: "Lebel", price: 390), InventoryItem(name: "Crossbow", price: 110)]
        secondaryData = [InventoryItem(), InventoryItem(name: "Uppercut", price: 275), InventoryItem(name: "Officer", price: 90), InventoryItem(name: "Pax", price: 100)]
        toolData = [InventoryItem(), InventoryItem(name: "Knife", price: 20), InventoryItem(name: "Medkit", price: 25), InventoryItem(name: "Fusees", price: 10),InventoryItem(name: "Dusters", price: 15),InventoryItem(name: "Chokes", price: 55)]
        consumableData = [InventoryItem(), InventoryItem(name: "Frag", price: 70), InventoryItem(name: "Vitality", price: 75), InventoryItem(name: "Antidote", price: 25), InventoryItem(name: "HellFire", price: 45), InventoryItem(name: "Sticky", price: 55), InventoryItem(name: "Stamina", price: 40)]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = hunter.name
        var aliveString: String
        if hunter.alive {
            aliveString = "Status: Alive"
        } else {
            aliveString = "Status: Dead"
        }
        isAliveField.text = aliveString
        let primaryIndex = primaryData.firstIndex(of: hunter.primary)
        primaryField.selectRow(primaryIndex!, inComponent: 0, animated: true)
        let secondaryIndex = secondaryData.firstIndex(of: hunter.secondary)
        secondaryField.selectRow(secondaryIndex!, inComponent: 0, animated: true)
        let tool1Index = toolData.firstIndex(of: hunter.tool1)
        tool1Field.selectRow(tool1Index!, inComponent: 0, animated: true)
        let tool2Index = toolData.firstIndex(of: hunter.tool2)
        tool2Field.selectRow(tool2Index!, inComponent: 0, animated: true)
        let tool3Index = toolData.firstIndex(of: hunter.tool3)
        tool3Field.selectRow(tool3Index!, inComponent: 0, animated: true)
        let tool4Index = toolData.firstIndex(of: hunter.tool4)
        tool4Field.selectRow(tool4Index!, inComponent: 0, animated: true)
        let consumable1Index = consumableData.firstIndex(of: hunter.consumable1)
        consumable1Field.selectRow(consumable1Index!, inComponent: 0, animated: true)
        let consumable2Index = consumableData.firstIndex(of: hunter.consumable2)
        consumable2Field.selectRow(consumable2Index!, inComponent: 0, animated: true)
        let consumable3Index = consumableData.firstIndex(of: hunter.consumable3)
        consumable3Field.selectRow(consumable3Index!, inComponent: 0, animated: true)
        let consumable4Index = consumableData.firstIndex(of: hunter.consumable4)
        consumable4Field.selectRow(consumable4Index!, inComponent: 0, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
        
        hunter.totalValue = 0
        hunter.name = nameField.text ?? ""
        hunter.primary = primaryData[primaryField.selectedRow(inComponent: 0)]
        hunter.totalValue += hunter.primary.price
        hunter.secondary = secondaryData[secondaryField.selectedRow(inComponent: 0)]
        hunter.totalValue += hunter.secondary.price
        hunter.tool1 = toolData[tool1Field.selectedRow(inComponent: 0)]
        hunter.tool2 = toolData[tool2Field.selectedRow(inComponent: 0)]
        hunter.tool3 = toolData[tool3Field.selectedRow(inComponent: 0)]
        hunter.tool4 = toolData[tool4Field.selectedRow(inComponent: 0)]
        hunter.totalValue += hunter.tool1.price + hunter.tool2.price + hunter.tool3.price + hunter.tool4.price
        hunter.consumable1 = consumableData[consumable1Field.selectedRow(inComponent: 0)]
        hunter.consumable2 = consumableData[consumable2Field.selectedRow(inComponent: 0)]
        hunter.consumable3 = consumableData[consumable3Field.selectedRow(inComponent: 0)]
        hunter.consumable4 = consumableData[consumable4Field.selectedRow(inComponent: 0)]
        hunter.totalValue += hunter.consumable1.price + hunter.consumable2.price + hunter.consumable3.price + hunter.consumable4.price
    }
    
}
