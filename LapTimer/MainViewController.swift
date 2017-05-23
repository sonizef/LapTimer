//
//  MainViewController.swift
//  LapTimer
//
//  Created by Joris ZEFIRINI on 21/04/2017.
//  Copyright © 2017 SoniWeb. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class MainViewController: UIViewController{

    //Objets et variables
    var tableChronos: LesChronosTableViewController!
    var currentChrono: ChronoViewController?
    var numChrono = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "background.jpg")!)
        volumeButtonInit()
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
        
        currentChrono?.selectedBackground.alpha = 0
        
        //On s'assure que le chiffre entrée soit censé
        if(num < tableChronos.lesChronos.count){
            numChrono = num
            currentChrono = tableChronos.lesChronos[numChrono]
        }
        else{
            numChrono = 0
            currentChrono = tableChronos.lesChronos[numChrono]
        }
        
        currentChrono?.selectedBackground.alpha = 0.1
    }
    
    //Initalise l'ecouteur pour les boutons volumes
    func volumeButtonInit(){
        let volumeView = MPVolumeView(frame: CGRect(x: -1000, y: -1000, width: 1, height: 1))
        self.view.addSubview(volumeView)
        
        audioSession.addObserver(self, forKeyPath: "outputVolume", options: NSKeyValueObservingOptions(rawValue: 0), context: nil)
    }
    
    
    //Override
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "tableChronos"){
            tableChronos = segue.destination as! LesChronosTableViewController
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if(keyPath == "outputVolume"){
            let volumeLevel = MPMusicPlayerController.applicationMusicPlayer().value(forKeyPath: "volume") as! Float
            if(volumeLevel > currentVolume){
                //Quand on augmente le son
                
                //Si chrono deja lancé, fonction "track"
                if(currentChrono?.timer?.isValid == false){
                    currentChrono?.track()
                }
                else{
                    currentChrono?.start((currentChrono?.btnStart)!)
                }
            }
            
            if(volumeLevel < currentVolume){
                //Quand on baisse le son
                changeChrono(numChrono + 1)
                
            }
            
            //On remet toujours le volume à son origine
            (MPVolumeView().subviews.filter{NSStringFromClass($0.classForCoder) == "MPVolumeSlider"}.first as? UISlider)?.setValue(currentVolume, animated: false)
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
