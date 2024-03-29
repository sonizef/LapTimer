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
    var time = "00:00.00"
    var min = 0
    var sec = 0
    var cent = 0
    var nbTours = 0
    
    
    //Outlet
    @IBOutlet weak var lblMain: UILabel!
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet var lblSecondary: [UILabel]!
    @IBOutlet weak var selectedBackground: UIView!
    @IBOutlet weak var lblDiff: UILabel!
    @IBOutlet weak var lblBest: UILabel!
    
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
        if(timer == nil){
            
        }
        else if(timer?.isValid)!{
            track()
        }
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
    
        time = dateFormatter.string(from: dateFormatter.date(from: "\(min):\(sec).\(cent)")!)
        lblMain.text = time
        
    }
    
    //Demarre le chrono
    func start(_ btn:UIButton){
        if(btn.isSelected == false){
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
        
        lblMain.text = "\(String(format: "%02d", min)):\(String(format: "%02d", sec)).\(String(format: "%02d", cent))"
        lblBest.text = lblMain.text
        lblSecondary[0].text = lblMain.text
        lblSecondary[1].text = lblMain.text
        lblSecondary[2].text = lblMain.text
        lblDiff.text = lblMain.text
        lblDiff.textColor = UIColor.white
        
        if(btnStart.isSelected){
            btnStart.isSelected = false
        }
    }
    
    //Active un tours
    func track(){
        nbTours += 1
        
        lblSecondary[2].text = lblSecondary[1].text
        lblSecondary[1].text = lblSecondary[0].text
        
        if(lblMain.isBest(t: lblBest.text!)){
            lblBest.text = lblMain.text
        }
        
        if(lblSecondary[0].text != "00:00.00"){
            let diff = getDiff(t1: lblMain.text!, t2: lblSecondary[0].text!)
            if(diff[0] == "0"){
                lblDiff.textColor = UIColor.green
                lblDiff.text = "+\(diff[1])"
            }
            else if(diff[0] == "2"){
                lblDiff.textColor = UIColor.white
                lblDiff.text = "00:00.00"
            }
            else{
                lblDiff.textColor = UIColor.red
                lblDiff.text = "-\(diff[1])"
            }
        }
        else{
            lblBest.text = lblMain.text
        }
        
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
