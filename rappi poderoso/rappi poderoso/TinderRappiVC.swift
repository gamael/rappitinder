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
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.show(view: view)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    //MARK: -Acciones
    @IBAction func presionoGusta(_ sender: UIButton) {
    }
    
    @IBAction func presionoNoGusta(_ sender: UIButton) {
    }

}

