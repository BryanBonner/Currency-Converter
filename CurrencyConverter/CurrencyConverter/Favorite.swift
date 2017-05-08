//
//  Favorite.swift
//  CurrencyConverter
//
//  Created by CampusUser on 5/7/17.
//  Copyright © 2017 CPSC411. All rights reserved.
//

import Foundation

class Favorite: NSObject, NSCoding {
    
    var favoriteCurrency = ""
    
    
    required init(coder decoder: NSCoder) {
        if let favoriteCurrencyObj = decoder.decodeObject(forKey: favoriteCurrency) as? String {
            favoriteCurrency = favoriteCurrencyObj
        }
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(favoriteCurrency, forKey: favoriteCurrency)
    }
    
 
    
    
}
