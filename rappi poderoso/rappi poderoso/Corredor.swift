//
//  Corredor.swift
//  rappi poderoso
//
//  Created by Alejandro Agudelo on 20/10/18.
//  Copyright © 2018 Alejandro Agudelo. All rights reserved.
//

import Foundation

struct Corredor {
    
    var parent_id: Int?
    var id: Int
    var name: String
    
    init?(json: [String: Any]) {
        guard let parent_id = json["parent_id"] as? Int,
        let id = json["id"] as? Int,
        let name = json["name"] as? String
            else {
                return nil
        }
        
        self.parent_id = parent_id
        self.id = id
        self.name = name
        
    }
}
