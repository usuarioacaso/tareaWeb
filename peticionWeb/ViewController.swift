//
//  ViewController.swift
//  peticionWeb
//
//  Created by Adrian Camacho Soriano on 19/02/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//
// https://github.com/usuarioacaso/acaso.git
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var capturaIsbn: UITextField!
    
    @IBOutlet weak var muestraInfo: UITextView!
    
    @IBAction func busqueda(sender: UIButton) {
        print(capturaIsbn.text)
        llamada()
    }
    
    var isbn:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //llamada()
    }
    
    func llamada(){
        //let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:978-84-376-0494-7"
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=\(capturaIsbn.text!)"
        let url = NSURL(string: urls)
        let sesion = NSURLSession.sharedSession()
        let bloque = {
            (datos:NSData?, resp:NSURLResponse?, error: NSError?) -> Void in
            let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
            print(texto!)
            //self.muestraInfo.text = texto! as String
        }
        let dt = sesion.dataTaskWithURL(url!, completionHandler: bloque)
        dt.resume()
        let datos:NSData? = NSData(contentsOfURL: url!)
        let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
        //print(texto!)
        self.muestraInfo.text = texto! as String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

