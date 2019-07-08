//
//  ViewController.swift
//  dicesGame
//
//  Created by Salvador Martí Solsona on 05/07/2019.
//  Copyright © 2019 Salvador Martí Solsona. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Definición de propiedades -------------------
    @IBOutlet weak var labelRoyalCasino: UILabel!
    @IBOutlet weak var dice1: UIImageView!
    @IBOutlet weak var dice2: UIImageView!
    @IBOutlet weak var dice3: UIImageView!
    
    @IBOutlet weak var playButton: UIButton!
    //---------------------------------------------
    

    //Numeros aleatorios para los tres dados.
    //--------------------------------------
    var randomNumber1 : Int = 0
    var randomNumber2 : Int = 0
    var randomNumber3 : Int = 0
    //--------------------------------------
    
    
    //Vector de Strings (nombres de las imagenes de las caras)
    //Definimos el array como LET porque es un ente inmutable, nunca va a cambiar con el paso del tiempo. Pasamos de var --> let
    let imageArray : [String]
    let nFaces : UInt32
    
    
    // INICIALIZADOR POR DEFECTO PARA INICIALIZAR VARIABLES GLOBALES QUE DEPENDEN DE OTRAS Y QUE NO HAN PODIDO INICIALIZARSE ANTES.
    //
    required init?(coder aDecoder: NSCoder) {
        imageArray = ["face-1","face-2","face-3","face-4","face-5","face-6"]
        nFaces =  UInt32(self.imageArray.count)
        super.init(coder: aDecoder)
    }
    //---------------------------------------------------------------------------------------------------------------------------
    
    
    //Método que se ejecuta al arrancar la app
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        generateRandomNumbersDices()
    }

    //FUNCIONES DEL SISTEMA ---------------------------------
    
    //Generar numeros aleatorios
    func generateRandomNumbersDices() {
        
        randomNumber1 = Int(arc4random_uniform(nFaces))
        randomNumber2 = Int(arc4random_uniform(nFaces))
        randomNumber3 = Int(arc4random_uniform(nFaces))
        
        //self.dice1.image = UIImage(named: imageArray[randomNumber1])
        //self.dice2.image = UIImage(named: imageArray[randomNumber2])
        //self.dice3.image = UIImage(named: imageArray[randomNumber3])
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: UIView.AnimationOptions.curveEaseOut,
            animations: {
                
                self.dice1.transform = CGAffineTransform(scaleX: 0.7, y: 0.7).concatenating(CGAffineTransform(translationX: 0, y: -70)).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi))
                self.dice2.transform = CGAffineTransform(scaleX: 0.8, y: 0.8).concatenating(CGAffineTransform(translationX: 0, y: 40)).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi))
                self.dice3.transform = CGAffineTransform(scaleX: 0.7, y: 0.7).concatenating(CGAffineTransform(translationX: 0, y:-70)).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi))
                
                
        }) { (completed) in
            
            self.dice1.transform = CGAffineTransform.identity
            self.dice2.transform = CGAffineTransform.identity
            self.dice3.transform = CGAffineTransform.identity
            
            self.dice1.image = UIImage(named: self.imageArray[self.randomNumber1])
            self.dice2.image = UIImage(named: self.imageArray[self.randomNumber2])
            self.dice3.image = UIImage(named: self.imageArray[self.randomNumber3])
        }
    }
    
    //-------------------------------------------------------


    //EVENTOS -----------------------------------------------

    //Evento click botón JUGAR
    @IBAction func touchPlay(_ sender: UIButton) {
        generateRandomNumbersDices()
    }
    
    //SHAKE DEL DISPOSITIVO (TRUE)-----------------------------------------------------
    
    //Preparamos el dispositivo para que acepte el shake en la app. (true)
    override func becomeFirstResponder() -> Bool {
        return true
    }
    //Al acabar el gesto --> si es motionshake --> generateRandomNumbersDices()
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            generateRandomNumbersDices()
        }
    }
    
    //-----------------------------------------------------------------------------------
    
}
