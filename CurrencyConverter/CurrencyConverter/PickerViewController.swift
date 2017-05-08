//
//  PickerViewController.swift
//  CurrencyConverter
//
//  Created by CampusUser on 5/1/17.
//  Copyright © 2017 CPSC411. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var Data: CurrencyData = CurrencyData.shared
    
    var currentSelection: String = ""
    
    @IBOutlet weak var currencyPickerView: UIPickerView!
    @IBOutlet weak var favoriteAddedLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        currencyPickerView.dataSource = self
        currencyPickerView.delegate = self
        Data = CurrencyData.shared
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Adds selected currency from view picker to the user's favorite currency list.
    //    Removes the default "Choose from favorites!" seen on the ConvertView screen,
    //       Removes the data from the picker view to avoid duplicate adds to favorite
    //           Displays a confirmation that the selected currency was added
    @IBAction func addToHome(_ sender: Any) {
        Data.favoriteCurrency.append(currentSelection)
        if Data.favoriteCurrency[0] == "Choose some favorites!" {
          Data.favoriteCurrency.remove(at: 0)
        }
        if let targetIndex = Data.pickerData.index(of: currentSelection) {
            Data.pickerData.remove(at: targetIndex)
        }
        favoriteAddedLabel.text = currentSelection + " added!"
       
        print(currentSelection)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Data.pickerData.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        currentSelection = Data.pickerData[row]
        return Data.pickerData[row]
    }
}
