//
//  DataModel.swift
//  I Like It
//
//  Created by Nick Gibson on 11/7/23.
//

import Foundation

//var items: [Item] = load("data.json")

let item1 = Item(productName: "Crispy Honey Shrimp", brand: "P.F. Changs", liked: true, notes: "Goold flavor and texture")
let item2 = Item(productName: "Bourbon Chicken Pasta (bag)", brand: "Zatarain's", liked: true, notes: "Tasty, easy to make")
let item3 = Item(productName: "Bourbon CHicken Pasta (box)", brand: "Zatarain's", liked: false, notes: "Wrong pasta, bad sauce")
let item4 = Item(productName: "Fries", liked: true, notes: "Well seasoned. Croonch")
let item5 = Item(productName: "Texas Cheesesteak Plate", liked: true, notes: "")
let cat4 = Item(categoryName: "Fast Food", items: [item4])
let cat5 = Item(categoryName: "Dine-In", items: [item5])
let cat3 = Item(categoryName: "Restaraunts", items: [cat4, cat5])
let cat2 = Item(categoryName: "Frozen Food", items: [item1, item2, item3])
let cat1 = Item(categoryName: "Grocery", items: [cat2])
let items = [cat1, cat3]


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in  main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func save<T: Encodable>(_ filename: String, item: T) {
    let encoder = JSONEncoder()
    do {
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in  main bundle")
        }
        let encoded = try encoder.encode(items)
        let jsonString = String(data: encoded, encoding: .utf8)
        try jsonString?.write(to: file, atomically: true, encoding: .utf8)
    } catch {
        fatalError("Couldn't write \(filename) from main bundle:\n\(error)")
    }
}
