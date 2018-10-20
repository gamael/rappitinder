//
//  loginVC.swift
//  rappi poderoso
//
//  Created by Alejandro Agudelo on 19/10/18.
//  Copyright © 2018 Alejandro Agudelo. All rights reserved.
//

import UIKit
import RevealingSplashView

class loginVC: UIViewController {
    
    //MARK: -Funciones
    override func viewDidLoad() {
        super.viewDidLoad()
        //Initialize a revealing Splash with with the iconImage, the initial size and the background color
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "rappiSplash")!,iconInitialSize: CGSize(width: 210, height: 110), backgroundColor: UIColor(red:255, green:255, blue:255, alpha:1.0))
        
        //Adds the revealing splash view as a sub view
        self.view.addSubview(revealingSplashView)
        
        //Starts animation
        revealingSplashView.startAnimation()
        
    }
   
}
