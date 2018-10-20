//
//  TinderRappiVC.swift
//  rappi poderoso
//
//  Created by Alejandro Agudelo on 19/10/18.
//  Copyright © 2018 Alejandro Agudelo. All rights reserved.
//

import UIKit


class TinderRappiVC: UIViewController {
    //MARK: -Variables
    private let spinner = Spinner()
    private let tinderServicios =  TinderServicios()
    private var productos: Producto?
    
    
    //MARK: -Outlets
    @IBOutlet weak var productosGustadosLabel: UILabel!
    @IBOutlet weak var nombreProductoLabel: UILabel!
    @IBOutlet weak var productoImageView: UIImageView!
    
    
    
    
    //MARK: -Funciones
    //MARK: Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        self.spinner.show(view: self.view)
        getProductos()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func getProductos() {
        tinderServicios.GETproductosTinderPeticion(completion: { producto in
            if let p = producto {
                self.establecerImagen(urlImagen: p.image)
            }
            
        })
    }
    
//    func setProductos() {
//        
//    }
    
    func establecerImagen(urlImagen url: String) {
        
        let url1 = Registro.Servicios.URLImagenes + url
        let url2 = URL(string: url1)
        let data = try? Data(contentsOf: url2!)
        
        if let imageData = data {
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.productoImageView.image = image
            }
            spinner.hide()
        }
        
        
        
    }
    
    
    
    
    
    //MARK: -Acciones
    @IBAction func presionoGusta(_ sender: UIButton) {
        spinner.show(view: view)
        getProductos()
    }
    
    @IBAction func presionoNoGusta(_ sender: UIButton) {
        spinner.show(view: view)
        getProductos()
    }

}

