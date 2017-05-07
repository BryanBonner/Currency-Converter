//
//  CurrencyData.swift
//  CurrencyConverter
//
//  Created by Bryan Bonner on 4/13/17.
//  CPSC 411 - Assignment 4
//

import Foundation


class CurrencyData {
    //NSObject, NSCoding
    var price: Double
    var favoriteCurrency: [String]
    var pickerData: [String]
   // var currencyDictionary: [String: [String]]
    
    //init(price: Double, currencyDictionary: [String: [String]]) {
    init(price: Double, favoriteCurrency: [String], pickerData: [String]) {
        self.price = price
      //  self.currencyDictionary = currencyDictionary
        self.favoriteCurrency = favoriteCurrency
        self.pickerData = pickerData
     
    }
    
    // MARK: NSCoding
//    public convenience required init?(coder aDecoder: NSCoder) {
//        let price = aDecoder.decodeObject(forKey: "price") as! Double
//        let favoriteCurrency = aDecoder.decodeObject(forKey: ["favoriteCurrency"]) as! String
//    
//        self.init(price:price, favoriteCurrency:favoriteCurrency)
//    }
//    
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(price, forKey: "price")
//        aCoder.encode(favoriteCurrency, forKey: "favoriteCurrency")
//    }
    
    // Singleton Pattern
    static let shared: CurrencyData = CurrencyData(price: 0.0, favoriteCurrency: ["Choose some favorites!"], pickerData: ["United States dollar", "Euro", "Japanese yen", "Pound sterling", "Australian dollar", "Canadian dollar", "Swiss franc", "Chinese yuan", "Swedish krona", "New Zealand dollar", "Mexican Peso", "Singapore dollar", "Hong Kong dollar", "Norwegian krone", "South Korean won", "Turkish Lira", "Russian ruble", "Indian rupee", "Brazilian real", "South African rand"])
    
    //currencyDictionary: "United States Dollar = ["USD", "0.0", "$"])
    
}
