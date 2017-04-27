//
//  ChronoViewController.swift
//  LapTimer
//
//  Created by Joris ZEFIRINI on 20/04/2017.
//  Copyright © 2017 SoniWeb. All rights reserved.
//

import UIKit

class ChronoViewController: UIViewController {
    
    //Objets et variables
    var timer: Timer?
    var min = 0
    var sec = 0
    var cent = 0
    
    //Outlet
    @IBOutlet weak var lblMain: UILabel!
    @IBOutlet weak var btnStart: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Actions des boutons
    @IBAction func start(_ sender: UIButton) {
        if(sender.titleLabel?.text == "Start"){
            sender.isSelected = true
            timer = startTimer(self)
        }
        else{
            sender.isSelected = false
            timer?.invalidate()
        }
    }
    
    @IBAction func track(_ sender: Any) {
    }
    
    //Fonctions
    //Compteur qui incremente
    func counter(){
        
        cent += 1
        
        if(cent == 100){
            cent = 0
            sec += 1
        }
        if(sec == 60){
            sec = 0
            min += 1
        }
    
        
        lblMain.text = "\(String(format: "%02d", min)):\(String(format: "%02d", sec)):\(String(format: "%02d", cent))"
        
    }
    
    //Remet le compteur à 0
    func reset(){
        timer?.invalidate()
        min = 0
        sec = 0
        cent = 0
        
        lblMain.text = "\(String(format: "%02d", min)):\(String(format: "%02d", sec)):\(String(format: "%02d", cent))"
        
        if(btnStart.isSelected){
            btnStart.isSelected = false
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
