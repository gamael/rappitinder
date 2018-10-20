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
    
    func GETproductosTinderPeticion( completion: @escaping ([Producto]) -> Void ) {
        let urlTinder = "\(Registro.Servicios.URLServicios)random/\(Registro.Configuraciones.productosTinderDefecto)"
        Alamofire.request(urlTinder).responseJSON {response in
            // response serialization result
            if let jsonArray = response.result.value {
                var productosRetorno: [Producto] = [Producto]()
                for json in jsonArray as! [[String : Any]] {
                    //productosRetorno.append(Producto.init(json: json)!)
                    if let producto = Producto.init(json: json) {
                        productosRetorno.append(producto)
                    }
                }
                completion(productosRetorno)
            }
        }
    }
    
}


