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
        guard let image = json["image"] as? String,
            let name = json["name"] as? String
            else {
                return nil
        }
        
        self.image = image
        self.name = name
        self.corridors = nil
        self._id = ""
        self.description = ""
        self.store_id = 0
        self.price = 0
        self.product_id = 0
                
    }

}
