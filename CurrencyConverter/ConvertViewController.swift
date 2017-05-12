//
//  ConvertViewController.swift
//  CurrencyConverter
//
//  Created by Bryan Bonner
//

import UIKit

class ConvertViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    // Users current selection
    var currentSelection: String = ""
    
    // Currency to convert
    var currencyAmount: String = ""
    
    // Singleton instance
    var Data: CurrencyData = CurrencyData.shared
    
    // Favorite currency to store in archiver
    var FavoriteData = [Favorite]()
    
    // Safe recommended path - referenced from youtuber "Awesome Tuts" (awesometuts.com)
    var filePath: String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        return url!.appendingPathComponent("FavoriteData").path
    }
    
    // Saves data to the above file path as an array of favoriteCurrency - referenced awesometuts.com
    func saveData(favoriteCurrency: Favorite) {
        FavoriteData.append(favoriteCurrency)
        NSKeyedArchiver.archiveRootObject(FavoriteData, toFile: filePath)
    }
    // Load data on startup from file path - awesometuts.com
    func loadData() {
        if let ourData = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Favorite] {
            FavoriteData = ourData
        }
    }
    
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var foreignLabel: UILabel!
    @IBOutlet weak var setForeignButton: UIButton!
    @IBOutlet weak var setHomeButton: UIButton!
    @IBOutlet weak var currencyTextField: UITextField!
   
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        Data = CurrencyData.shared //Get shared instance everytime user swipes back to the convert view
        currencyTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        currencyAmount = textField.text!
    }
    
    //MARK: UITableView
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
    
    // Set current selection string to the current cell the user has selected
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
    // Set home buton when pressed - sets the home selection to the current home currency symbol and current selection, changes the home label to the currency name, hides the home button and shows the "add foreign" button
    @IBAction func setHomePush(_ sender: UIButton) {
        Data.homeSelection = currentSelection
        homeLabel.text = Data.getCurrencyISO(target: Data.homeSelection) + currentSelection
        
        //let newFavorite = Favorite(coder: currentSelection)
        //saveData(newFavorite)
       
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
    // Convert is pressed - right now just prints the value from the dictionary in CurrencyData, rate is currently not working
    @IBAction func convertPush(_ sender: UIButton) {
        //Data.getCurrencyISO(target: Data.homeSelection)
       // Data.getCurrencySymbol(home: Data.homeSelection, foreign: Data.foreignSelection)
        
        // Get the rate from YQL as a float
        let rate = Data.setCurrencyRate(home: Data.homeSelection, foreign: Data.foreignSelection)
        
        // Multiple rate by currencyAmount - the amount the user input
        let result = rate * (currencyAmount as NSString).floatValue
        
        // Display result as a string
        resultLabel.text = String(result)
        
    }
    
}
