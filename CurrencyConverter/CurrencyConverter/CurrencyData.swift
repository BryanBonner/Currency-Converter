//
//  CurrencyData.swift
//  CurrencyConverter
//
//  Created by Bryan Bonner
//  CPSC 411 - Assignment 4
//

import Foundation


class CurrencyData {
    
    // Dictionary of Currency Symbols - Key: Currency, Value: Currency Symbol
    var currencySymbol: [String: [String]] = ["United States dollar": ["USD", "$"], "Euro": ["EUR", "€"], "Japanese yen": ["JPY", "¥"], "Pound sterling": ["GBP", "£"], "Australian dollar": ["AUD", "$"], "Canadian dollar": ["CAD", "$"], "Swiss franc": ["CHF", "Fr"], "Chinese yuan": ["CNY", "¥"], "Swedish krona": ["SEK", "kr"], "New Zealand dollar": ["NZD", "$"], "Mexican Peso": ["MXN", "$"], "Singapore dollar": ["SGD", "$"], "Hong Kong dollar": ["HKD", "$"], "Norwegian krone": ["NOK", "kr"], "South Korean won": ["KRW", "₩"],"Turkish Lira": ["TRY", "₺"], "Russian ruble": ["RUB", "₽"], "Indian rupee": ["INR", "₹"], "Brazilian real": ["BRL", "R$"], "South African rand": ["ZAR", "R"]]
    
    // Dictionary of Currency Rates - Key: Currency Symbol, Value: Currency Rate retrieved from YQL
    var currencyRates: [String: Float] = [:]
    
    var price: Double
    var favoriteCurrency: [String]
    var pickerData: [String]
    var homeSelection: String
    var foreignSelection: String
    var rate: Float
    //var lastQueryTime: Int
    
    init(price: Double, favoriteCurrency: [String], pickerData: [String], homeSelection: String, foreignSelection: String, rate: Float) {
        self.price = price
      //  self.currencyDictionary = currencyDictionary
        self.favoriteCurrency = favoriteCurrency
        self.pickerData = pickerData
        self.homeSelection = homeSelection
        self.foreignSelection = foreignSelection
        self.rate = rate
     
    }
    func getCurrencyISO(target: String) -> String{
        return (currencySymbol[target]![1])
    }
    func getCurrencySymbol(home: String, foreign: String) {
        let query1 = currencySymbol[home]?[0]
        let query2 = currencySymbol[foreign]?[0]
        print(query1!)
        print(query2!)
    }
    func setCurrencyRate(home: String, foreign: String) {
        let query1 = currencySymbol[home]?[0]
        let query2 = currencySymbol[foreign]?[0]
        
         //  if (currencyRates.contains(symbol) && lastQueryTime < 1 day
        let myYQL = YQL()
        let queryString = "select * from yahoo.finance.xchange where pair in (\"" + query1! + query2! + "\")"
        myYQL.query(queryString) { jsonDict in
            let queryDict = jsonDict["query"] as! [String: Any]
            print(queryDict)
            
            // currencyRates[currencySymbol[home]] = queryDict[rates][0]
            // currencyRates[currencySymbol[foreign]] = queryDict[rates][1]
        }
        // else return currencyRates[symbol]
    }
    
    // Singleton Pattern
    static let shared: CurrencyData = CurrencyData(price: 0.0, favoriteCurrency: ["Choose some favorites!"], pickerData: ["United States dollar", "Euro", "Japanese yen", "Pound sterling", "Australian dollar", "Canadian dollar", "Swiss franc", "Chinese yuan", "Swedish krona", "New Zealand dollar", "Mexican Peso", "Singapore dollar", "Hong Kong dollar", "Norwegian krone", "South Korean won", "Turkish Lira", "Russian ruble", "Indian rupee", "Brazilian real", "South African rand"], homeSelection: "", foreignSelection: "", rate: 0.0)
    
}
