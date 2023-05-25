//
//  ViewController.swift
//  dropDown
//
//  Created by Miguel Gómez Díaz on 24/05/23.
//

import Cocoa

class ViewController: NSViewController, NSComboBoxDelegate, NSComboBoxDataSource{
    
    let items =  ["Hola", "Adios", "Hasta la vista"]

    @IBOutlet weak var combiLista: NSComboBox!
    @IBOutlet var vistaP: NSView!
    @IBOutlet weak var vista1: NSView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        combiLista.delegate = self
        combiLista.dataSource = self
        

        
        for item in items {
            combiLista.addItem(withObjectValue: item)
        }
        
        
        
    }
    func numberOfItems(in comboBox: NSComboBox) -> Int {
        return items.count
    }
    
    func comboBoxSelectionDidChange(_ notification: Notification) {
        if let comboBox = notification.object as? NSComboBox{
            let selectedIndex = comboBox.indexOfSelectedItem
            let selectedValue = items[selectedIndex]
            print("ValorSeleccionado: \(selectedValue)")
        }
    }
    
    func comboBox(_ combobox:NSComboBox, objectValueForItemAt index: Int) -> Any? {
        return items[index]
    }
    
    func clearAndAddItems() {
        combiLista.usesDataSource = false
        combiLista.isEditable = false
        combiLista.removeAllItems()
    }
}

