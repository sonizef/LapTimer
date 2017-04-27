//
//  MainViewController.swift
//  LapTimer
//
//  Created by Joris ZEFIRINI on 21/04/2017.
//  Copyright © 2017 SoniWeb. All rights reserved.
//

import UIKit

class MainViewController: UIViewController{

    //Objets et variables
    var tableChronos: LesChronosTableViewController!
    var currentChrono: ChronoViewController?
    var numChrono = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        changeChrono(0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Actions des boutons
    @IBAction func resetAll(_ sender: Any) {
        
        for chrono in tableChronos.lesChronos {
            chrono.reset()
        }
    }
    
    @IBAction func changeCurrentChrono(_ sender: Any) {
        changeChrono(numChrono + 1)
    }
    
    //Fonctions
    //Change le chronos courant
    func changeChrono(_ num:Int){
        
        currentChrono?.view.backgroundColor = UIColor.clear
        
        //On s'assure que le chiffre entrée soit censé
        if(num < tableChronos.lesChronos.count){
            numChrono = num
            currentChrono = tableChronos.lesChronos[numChrono]
        }
        else{
            numChrono = 0
            currentChrono = tableChronos.lesChronos[numChrono]
        }
        
        currentChrono?.view.backgroundColor = UIColor.red
    }
    
    
    //Override
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "tableChronos"){
            tableChronos = segue.destination as! LesChronosTableViewController
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
