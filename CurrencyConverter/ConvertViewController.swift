//
//  ConvertViewController.swift
//  CurrencyConverter
//
//  Created by CampusUser on 4/29/17.
//  Copyright © 2017 CPSC411. All rights reserved.
//

import UIKit

class ConvertViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var list = ["Data", "Goes", "here"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Number of rows equal to number in the list
        return list.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    // Swipe on a table view row to and select delete to remove the item from the view/list
    // Courtesy of www.ioscreator.com/tutorials/delete-rows-table-view-ios8-swift
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Home"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
