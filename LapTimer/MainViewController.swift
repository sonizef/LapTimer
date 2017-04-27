//
//  MainViewController.swift
//  LapTimer
//
//  Created by Joris ZEFIRINI on 21/04/2017.
//  Copyright © 2017 SoniWeb. All rights reserved.
//

import UIKit

class MainViewController: UIViewController{

    var tableChronos: LesChronosTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetAll(_ sender: Any) {
        
        for chrono in tableChronos.lesChronos {
            chrono.reset()
        }
    }
    
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
