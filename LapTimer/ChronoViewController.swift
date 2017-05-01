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
    var nbTours = 0
    
    //Outlet
    @IBOutlet weak var lblMain: UILabel!
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet var lblSecondary: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Actions des boutons
    @IBAction func btnStart(_ sender: UIButton) {
        start(sender)
    }
    
    @IBAction func track(_ sender: Any) {
        track()
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
    
    //Demarre le chrono
    func start(_ btn:UIButton){
        if(btn.titleLabel?.text == "Start"){
            btn.isSelected = true
            timer = startTimer(self)
        }
        else{
            btn.isSelected = false
            timer?.invalidate()
        }
    }
    
    //Remet le compteur à 0
    func reset(){
        timer?.invalidate()
        min = 0
        sec = 0
        cent = 0
        
        lblMain.text = "\(String(format: "%02d", min)):\(String(format: "%02d", sec)):\(String(format: "%02d", cent))"
        lblSecondary[0].text = lblMain.text
        lblSecondary[1].text = lblMain.text
        lblSecondary[2].text = lblMain.text
        
        if(btnStart.isSelected){
            btnStart.isSelected = false
        }
    }
    
    //Active un tours
    func track(){
        nbTours += 1
        
        lblSecondary[2].text = lblSecondary[1].text
        lblSecondary[1].text = lblSecondary[0].text
        lblSecondary[0].text = lblMain.text
        
        min = 0
        sec = 0
        cent = 0
        
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
