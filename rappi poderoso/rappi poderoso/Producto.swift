//
//  Producto.swift
//  rappi poderoso
//
//  Created by Alejandro Agudelo on 20/10/18.
//  Copyright © 2018 Alejandro Agudelo. All rights reserved.
//

import Foundation

struct Producto {
    
    var corridors: [Corredor]?
    var _id: String
    var name: String
    var image: String
    var description: String
    var store_id: Int
    var price: Float
    var product_id: Int
    
    init?(json: [String: Any]) {
        guard let _id = json["_id"] as? String,
            let name = json["name"] as? String,
            let image = json["image"] as? String,
            let description = json["description"] as? String,
            let store_id = json["store_id"] as? Int,
            let price = json["price"] as? Float,
            let product_id = json["product_id"] as? Int
        
            else {
                return nil
        }
        
        self.image = image
        self.name = name
        self.corridors = nil
        self._id = _id
        self.description = description
        self.store_id = store_id
        self.price = price
        self.product_id = product_id
                
    }

}
