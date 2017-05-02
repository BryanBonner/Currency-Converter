//
//  PickerViewController.swift
//  CurrencyConverter
//
//  Created by CampusUser on 5/1/17.
//  Copyright © 2017 CPSC411. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    // Mark Properties
    var pickerData = ["United States dollar", "Eurso", "Japanese yen", "Pound sterling", "Australian dollar", "Canadian dollar", "Swiss franc", "Chinese yuan", "Swedish krona", "New Zealand dollar", "Mexican Peso", "Singapore dollar", "Hong Kong dollar", "Norwegian krone", "South Korean won", "Turkish Lira", "Russian ruble", "Indian rupee", "Brazilian real", "South African rand"]
    
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // CODE HERE
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // CODE HERE
        return pickerData[row]
    }

    

}
