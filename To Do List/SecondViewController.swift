//
//  SecondViewController.swift
//  To Do List
//
//  Created by Fran Primo Ruiz on 22/6/15.
//  Copyright (c) 2015 Fran Primo Ruiz. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addItemBtn(sender: AnyObject) {
        //Añadimos al array lo que el usuario introduzca en el textfield.
        toDoList.append(textField.text)
        textField.text = ""
        
        //Con esta linea de codigo almacenamos para siempre lo que añadimos en la tabla.
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Metodo para controlar el teclado
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    //Idem
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}

