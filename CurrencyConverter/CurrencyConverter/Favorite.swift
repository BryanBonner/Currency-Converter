//
//  Favorite.swift
//  CurrencyConverter
//
//  Bryan Bonner
//  Referenced from YouTuber "Awesome Tuts"

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
