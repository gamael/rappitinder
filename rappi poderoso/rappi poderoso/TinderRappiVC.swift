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
    private var productosServidor: [Producto]?
    private var indice = 0
    private var productosGustados = [String]()
    
    
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
    
    
    
    private func getProductos() {
        tinderServicios.GETproductosTinderPeticion(completion: { productos in
            self.productosServidor = productos
            self.mostrarProductos()
            
        })
    }
    
    private func mostrarProductos() {
        //La primera vez que se ejecuta, ya está el spinner
        if indice != 0 {
            spinner.show(view: view)
        }
        
        DispatchQueue.main.async {
            self.nombreProductoLabel.text = self.productosServidor?[self.indice].name ?? "Sin Nombre"
            self.productoImageView.image = self.getImagen(nombreImagen: (self.productosServidor?[self.indice].image)!) ?? UIImage(named: "sinImagen")!
            self.indice += 1
            self.spinner.hide()
            
        }
        
    }
    
    
    func getImagen(nombreImagen nombre: String) -> UIImage? {
        
        let urlTexto = Registro.Servicios.URLImagenes + nombre
        let data = try? Data(contentsOf: URL(string: urlTexto)!)
        
        if let imageData = data {
            return UIImage(data: imageData)
        } else {
            return nil
        }
        
        
    }
    
    
    
    
    
    //MARK: -Acciones
    @IBAction func presionoGusta(_ sender: UIButton) {
        productosGustados.append((productosServidor?[indice-1]._id)!)
        mostrarProductos()
        productosGustadosLabel.text = "Te han gustado \(productosGustados.count) productos"
    }
    
    @IBAction func presionoNoGusta(_ sender: UIButton) {
        mostrarProductos()
    }

}

