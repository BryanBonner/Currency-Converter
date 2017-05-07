//
//  ConvertViewController.swift
//  CurrencyConverter
//
//  Created by CampusUser on 4/29/17.
//  Copyright © 2017 CPSC411. All rights reserved.
//

import UIKit

class ConvertViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
  
    var homeSelection: String = ""
    var Data: CurrencyData = CurrencyData.shared
    
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var foreignLabel: UILabel!
    @IBOutlet weak var setForeignButton: UIButton!
    @IBOutlet weak var setHomeButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        Data = CurrencyData.shared
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Number of rows equal to number in the Data
        return Data.favoriteCurrency.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = Data.favoriteCurrency[indexPath.row]
        homeSelection = (cell.textLabel?.text)!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)! as UITableViewCell
        homeSelection = currentCell.textLabel!.text!
    }
    
    
    
    // Swipe on a table view row to and select delete to remove the item from the view/list
    //    Found from www.ioscreator.com/tutorials/delete-rows-table-view-ios8-swift
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            //Data.pickerData.append(Data.favoriteCurrency[indexPath.row])
            Data.favoriteCurrency.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            
        }
    }
    @IBAction func setHomePush(_ sender: UIButton) {
        homeLabel.text = homeSelection
        
        setForeignButton.isEnabled = true
        setForeignButton.isHidden = false
        print(homeSelection)
    }
    @IBAction func setForeignPush(_ sender: UIButton) {
        foreignLabel.text = homeSelection
        setHomeButton.isEnabled = true
        setHomeButton.isHidden = false
        print(homeSelection)
    }
}
