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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //let Data: CurrencyData = CurrencyData.shared
        currencyPickerView.dataSource = self
        currencyPickerView.delegate = self
        Data = CurrencyData.shared
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addToHome(_ sender: Any) {
        Data.favoriteCurrency.append(currentSelection)
        if Data.favoriteCurrency[0] == "Choose some favorites!" {
            Data.pickerData.remove(at: 0)
        }
        if let targetIndex = Data.pickerData.index(of: currentSelection) {
            Data.pickerData.remove(at: targetIndex)
        }
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
