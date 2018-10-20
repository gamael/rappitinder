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
    
    
    
    //MARK: -Outlets
    @IBOutlet weak var productosGustadosLabel: UILabel!
    @IBOutlet weak var nombreProductoLabel: UILabel!
    @IBOutlet weak var productoImageView: UIImageView!
    
    
    
    
    //MARK: -Funciones
    //MARK: Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        self.spinner.show(view: self.view)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        establecerImagen(urlImagen: "https://www.revistamoi.com/wp-content/uploads/2017/02/rappi.jpg")
    }
    
    func establecerImagen(urlImagen url: String) {
        
        let url2 = URL(string: url)
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
    }
    
    @IBAction func presionoNoGusta(_ sender: UIButton) {
    }

}

