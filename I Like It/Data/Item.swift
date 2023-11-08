//
//  Item.swift
//  I Like It
//
//  Created by Nick Gibson on 11/7/23.
//

import Foundation
import SwiftData

@Model
final class Item : Hashable, Codable, Identifiable {
    var Name: String
    var Brand: String?
    var Liked: Bool?
    var Notes: String?
    var ChildItems: [Item]?
    
    enum CodingKeys: String, CodingKey {
        case Name = "name"
        case Brand = "brand_name"
        case Liked = "liked"
        case Notes = "item_notes"
        case ChildItems = "items"
    }
    
    init(categoryName: String, items: [Item]?) {
        Name = categoryName
        if let items {
            ChildItems? = []
            ChildItems!.insert(contentsOf: items, at: 0)
        }
    }
    
    init(productName: String, brand: String, liked: Bool, notes: String) {
        self.Name = productName
        self.Brand = brand
        self.Liked = liked
        self.Notes = notes
    }
    
    init(productName: String, liked: Bool, notes: String) {
        self.Name = productName
        self.Brand = ""
        self.Liked = liked
        self.Notes = notes
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        Name = try values.decode(String.self, forKey: .Name)
        Brand = try values.decode(String.self, forKey: .Brand)
        Liked = try values.decode(Bool.self, forKey: .Liked)
        Notes = try values.decode(String.self, forKey: .Notes)
        ChildItems = try values.decode([Item].self, forKey: .ChildItems)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Name, forKey: .Name)
        try container.encode(Brand, forKey: .Brand)
        try container.encode(Liked, forKey: .Liked)
        try container.encode(Notes, forKey: .Notes)
        try container.encode(ChildItems, forKey: .ChildItems)
    }
}
