//
//  PickerViewController.swift
//  CurrencyConverter
//
//  Created by CampusUser on 5/1/17.
//  Copyright © 2017 CPSC411. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let Data: CurrencyData = CurrencyData.shared
    var pickerData = ["United States dollar", "Eurso", "Japanese yen", "Pound sterling", "Australian dollar", "Canadian dollar", "Swiss franc", "Chinese yuan", "Swedish krona", "New Zealand dollar", "Mexican Peso", "Singapore dollar", "Hong Kong dollar", "Norwegian krone", "South Korean won", "Turkish Lira", "Russian ruble", "Indian rupee", "Brazilian real", "South African rand"]
    var currentSelection: String = ""
    
    @IBOutlet weak var currencyPickerView: UIPickerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        currencyPickerView.dataSource = self
        currencyPickerView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addToHome(_ sender: Any) {
        Data.title.append(currentSelection)
        for title in Data.title {
            print(title)
        }
        print(currentSelection)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        currentSelection = pickerData[row]
        
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }

    

}
