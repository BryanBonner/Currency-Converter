//
//  ConvertViewController.swift
//  CurrencyConverter
//
//  Created by CampusUser on 4/29/17.
//  Copyright © 2017 CPSC411. All rights reserved.
//

import UIKit

class ConvertViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
  
    var currentSelection: String = ""
    var Data: CurrencyData = CurrencyData.shared
    var FavoriteData = [Favorite]()
    var filePath: String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        return url!.appendingPathComponent("FavoriteData").path
    }
    func saveData(favoriteCurrency: Favorite) {
        FavoriteData.append(favoriteCurrency)
        NSKeyedArchiver.archiveRootObject(FavoriteData, toFile: filePath)
    }
    func loadData() {
        if let ourData = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Favorite] {
            FavoriteData = ourData
        }
    }
    
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var foreignLabel: UILabel!
    @IBOutlet weak var setForeignButton: UIButton!
    @IBOutlet weak var setHomeButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        Data = CurrencyData.shared
        
        // Create path where we are going to store favorites
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Number of rows equal to number in the Data
        return Data.favoriteCurrency.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = Data.favoriteCurrency[indexPath.row]
        currentSelection = (cell.textLabel?.text)!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)! as UITableViewCell
        currentSelection = currentCell.textLabel!.text!
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
    // Set home buton when pressed - sets the home selection to the current selection, changes the home label to the currency name, hides the home button and shows the "add foreign" button
    @IBAction func setHomePush(_ sender: UIButton) {
        homeLabel.text = Data.getCurrencyISO(target: Data.foreignSelection) + currentSelection
        Data.homeSelection = currentSelection
        
//        let newFavorite = Favorite(coder: currentSelection)
//        saveData(newFavorite)
//        
        setHomeButton.isHidden = true
        setHomeButton.isEnabled = false
        setForeignButton.isHidden = false
        setForeignButton.isEnabled = true
        print(Data.homeSelection)
    }
    @IBAction func setForeignPush(_ sender: UIButton) {
        Data.foreignSelection = currentSelection
        foreignLabel.text = Data.getCurrencyISO(target: Data.foreignSelection) + currentSelection
        
        setForeignButton.isEnabled = false
        setForeignButton.isHidden = true
        setHomeButton.isEnabled = true
        setHomeButton.isHidden = false
        print(Data.foreignSelection)
    }
    // Convert is pressed - 
    @IBAction func convertPush(_ sender: UIButton) {
        //Data.getCurrencyISO(target: Data.homeSelection)
        Data.getCurrencySymbol(home: Data.homeSelection, foreign: Data.foreignSelection)
        Data.setCurrencyRate(home: Data.homeSelection, foreign: Data.foreignSelection)
        
    }
}
