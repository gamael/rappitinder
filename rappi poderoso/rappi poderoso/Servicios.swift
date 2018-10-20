//
//  Servicios.swift
//  rappi poderoso
//
//  Created by Alejandro Agudelo on 20/10/18.
//  Copyright © 2018 Alejandro Agudelo. All rights reserved.
//

import Foundation
import Alamofire

class TinderServicios {
    
    func GETproductosTinder() {
        let urlTinder = "\(Registro.Servicios.URLServicios)random/one"
        Alamofire.request(urlTinder).responseJSON {response in
                                 // response serialization result
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            
        }
        
        
    }
}


