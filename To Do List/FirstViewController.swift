//
//  FirstViewController.swift
//  To Do List
//
//  Created by Fran Primo Ruiz on 22/6/15.
//  Copyright (c) 2015 Fran Primo Ruiz. All rights reserved.
//

import UIKit

//Creo un array sin inicializar.
var toDoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var toDoTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Indicamos cuantas celdas va a tener. Tantas como valores tenga el array que la pasamos.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }

    //Crea el contenido de las celdas.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        //Si deslizo el dedo hacia la izquierda, elimino del array el valor que se encuentra en esa columna.
        if editingStyle == UITableViewCellEditingStyle.Delete {
            toDoList.removeAtIndex(indexPath.row)
            //Elimino de la "base de datos" el valor de la columna especificada.
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            //Recargo la tabla.
            toDoTable.reloadData()
        }
    }
    
    //Este metodo recarga la informacion en la tabla.
    override func viewDidAppear(animated: Bool) {
        toDoTable.reloadData()
    }


}

