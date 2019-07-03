//
//  ViewController.swift
//  iamrich
//
//  Created by Salvador Martí Solsona on 29/06/2019.
//  Copyright © 2019 Salvador Martí Solsona. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //PROPERTIES
    
    // Connection -> Outlet (Las outlets son las properties)
    //Storage (almacenamiento) debil - weak
    // @IBOutlet -> referencia interna para indicar a xcode que hace referencia a un objeto del storyboard
    
    //Tanto UILabel, UIImageView como UIButton son clases definidas en la libreria UIKit
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageViewDiamond: UIImageView!
    @IBOutlet weak var buttonPush: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MÉTODOS
    //funcion - EVENTO @IBAction cuando el usuario hace click en el boton
    // objeto sender : UIButton ; es quien ha llamado a esa función
    @IBAction func buttonPressed(_ sender: UIButton) {
    
        //Codigo para crear ventana emergente
        // Clase UIAlertController --> le paso un title, un message y un preferredStyle (.alert)
        
        //print("He pulsado el botón")
        if self.labelTitle.text == "I AM RICH!" {
            
            self.labelTitle.text = "I AM POOR!"
            self.imageViewDiamond.image = UIImage(named: "no-money-1")
            
            //self.labelTitle.textColor = UIColor.red
            //self.labelTitle.font = UIFont.systemFont(ofSize: 24.0)
            //print(self.buttonPush.title(for: .focused))
        }
        else {
            self.labelTitle.text = "I AM RICH!"
            self.imageViewDiamond.image = UIImage(named: "rubi")
        }
    }

    //Capturamos evento click en botón mensaje
    
    @IBAction func messagePressed(_ sender: UIButton) {
        
        let controller = UIAlertController(title: "", message: "", preferredStyle: .alert)
        //""", preferredStyle: .actionSheet)
        
        //Antes de mostrar la alerta, creamos el boton de aceptar o cancelar para salir de la alerta
        //let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        //CLOSURES
        
        //SINTAXIS 1 :
        let ok = UIAlertAction(title: "OK", style: .default) { (ok) in
            //print("He pulsado el botón aceptar")
        }
        
        //SINTAXIS 2:
        //let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: {(cancel) in
        //  print("He pulsado el botón cancelar")
        //})
        
        //SINTAXIS 3:
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            //print("He pulsado el botón cancelar")
        })
        
        controller.addAction(cancel)
        controller.addAction(ok)
        
        if self.labelTitle.text == "I AM RICH!" {
            controller.title = "I AM RICH!"
            controller.message = """
            I am rich,
            I deserve it.
            I am good,
            healthy and successful.
            """
        }
        else{
            controller.title = "I AM POOR!"
            controller.message = """
            A contented man is never poor,
            A humble man is never arrogant.
            """
        }
        self.show(controller, sender: nil)
    }
}
