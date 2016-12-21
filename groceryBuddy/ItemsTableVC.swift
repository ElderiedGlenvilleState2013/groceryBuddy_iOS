//
//  ItemsTableVC.swift
//  groceryBuddy
//
//  Created by RubyThree on 12/20/16.
//  Copyright © 2016 RubyThree. All rights reserved.
//

import UIKit

var items = [Item]()

class ItemsTableVC: UITableViewController {

    
    
    @IBOutlet var tableTasks: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleItems()
//        if UserDefaults.standard.object(forKey: "items") != nil  {
        
            
//        items = UserDefaults.standard.object(forKey: "items") as! [String] as! [Item]
        
        
//        }
    }
    
    func loadSampleItems(){
        let item1 = Item(name: "eggs", category: "food")!
        let item2 = Item(name: "ham", category: "food")!
        let item3 = Item(name: "milk", category: "beverage")!
        let item4 = Item(name: "salt", category: "condiment")!

        
        items += [item1, item2, item3, item4]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ItemCell"
        print(indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ItemCell
        let item = items[indexPath.row]
        
        cell.itemName.text = item.name
        cell.itemCategory.text = item.category

        return cell
    }
        
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            items.remove(at: indexPath.row)
            UserDefaults.standard.set(item_list, forKey: "list")
            tableTasks.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableTasks.reloadData()
    }
    
    func unwindToItemList(_ sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddItemsViewController, let item = sourceViewController.item {
            
            let newIndexPath = IndexPath(row: items.count, section: 0)
            items.append(item)
            print(item)
            tableTasks.insertRows(at: [newIndexPath], with: .bottom)
        }
    }
}
