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
        let urlPeticion = "\(Registro.Servicios.URLServicios)random/\(Registro.Configuraciones.productosTinderDefecto)"
        Alamofire.request(urlPeticion)
            .validate(statusCode: 200..<300)
            .responseJSON {response in
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
    
    func POSTproductosGustadosPeticion(productosGustados gustados: [String]) {
        let urlPeticion = "\(Registro.Servicios.URLServicios)liked"
        let parametros: Parameters = [ "likedIds": gustados ]
        
        Alamofire.request(urlPeticion, method: .post, parameters: parametros, encoding: JSONEncoding.default)
            .responseData {response in
                
                switch response.result {
                case .success:
                    print("Response: \(String(describing: response.response))")
                case .failure(let error):
                    print(error)
                }
                
        
            
        }
    }
    
}

class RecomendadosServicios {
    
    func GETproductosRecomendadosPeticion( completion: @escaping ([Producto]) -> Void ) {
        let urlPeticion = "\(Registro.Servicios.URLServicios)recommendations/\(Registro.Configuraciones.productosRecomendadosDefecto)"
        Alamofire.request(urlPeticion)
            .validate(statusCode: 200..<300)
            .responseJSON {response in
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


