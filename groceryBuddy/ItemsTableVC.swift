//
//  ItemsTableVC.swift
//  groceryBuddy


import UIKit

var items = [Item]()

class ItemsTableVC: UITableViewController {
    
    @IBOutlet var tableTasks: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleItems()

    }
    
    func loadSampleItems(){
        let item1 = Item(user_id: 1, itemName: "eggs", itemCategory: "food")!
        let item2 = Item(user_id: 1, itemName: "ham", itemCategory: "food")!
        let item3 = Item(user_id: 1, itemName: "milk", itemCategory: "beverage")!
        let item4 = Item(user_id: 1, itemName: "salt", itemCategory: "condiment")!

        
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
        
        let userID = UserDefaults.standard.integer(forKey: "userId")
        let itemData = itemDataBase()
        let results = try! itemData.getItems()

        for i in 0..<results.count {
            if(userID == results[i].user_id){
//                let itemPicked = results[indexPath.row]
//                cell.itemName.text = itemPicked.itemName
//                cell.itemCategory.text = itemPicked.itemCategory
            }
        }
        let item = items[indexPath.row]
        
        cell.itemName.text = item.itemName
        cell.itemCategory.text = item.itemCategory

        return cell
    }
        
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            items.remove(at: indexPath.row)
//            UserDefaults.standard.set(item_list, forKey: "list")
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
