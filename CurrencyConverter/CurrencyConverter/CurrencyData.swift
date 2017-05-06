//
//  CurrencyData.swift
//  CurrencyConverter
//
//  Created by Bryan Bonner on 4/13/17.
//  CPSC 411 - Assignment 4
//

import Foundation


class CurrencyData: NSObject, NSCoding {
    var price: Double
    var title: String
   // var currencyDictionary: [String: [String]]
    
    //init(price: Double, currencyDictionary: [String: [String]]) {
    init(price: Double, title: String) {
        self.price = price
      //  self.currencyDictionary = currencyDictionary
        self.title = title
     
    }
    
    func calculateDiscount() -> Double {
        return price - 1
    }
    
    // MARK: NSCoding
    public convenience required init?(coder aDecoder: NSCoder) {
        let price = aDecoder.decodeObject(forKey: "price") as! Double
        let title = aDecoder.decodeObject(forKey: "title") as! String
    
        self.init(price:price, title:title)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(price, forKey: "price")
        aCoder.encode(title, forKey: "title")
    }
    
    // Singleton Pattern
    //static let shared: CurrencyData = CurrencyData(price: 0.0, currencyDictionary: "United States Dollar = ["USD", "0.0", "$"])
    
}
