//
//  RecomendadosTVC.swift
//  rappi poderoso
//
//  Created by Alejandro Agudelo on 20/10/18.
//  Copyright © 2018 Alejandro Agudelo. All rights reserved.
//

import UIKit

class RecomendadosTVC: UITableViewController {
    
    private let spinner = Spinner()
    private let recomendadosServicios =  RecomendadosServicios()
    private var productosServidor: [Producto]?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.spinner.show(view: self.view)
        getProductos()
    }
    
    private func getProductos() {
        recomendadosServicios.GETproductosRecomendadosPeticion(completion: { productos in
            self.productosServidor = productos
            self.spinner.hide()
            self.tableView.reloadData()
        })
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

   

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return productosServidor?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)

        cell.textLabel?.text = productosServidor?[indexPath.row]
            .name ?? "Error en la red neuronal"
        return cell
    }
 
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }



    

}
