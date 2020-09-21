//
//  LobbyViewController.swift
//  TechMon200919
//
//  Created by Shinya  on 2020/09/19.
//  Copyright © 2020 Shinya . All rights reserved.
//

import UIKit

class LobbyViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var staminaLabel: UILabel!
    
    var stamina: Int = 100
    var staminaTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameLabel.text = "勇者"
        staminaLabel.text = "\(stamina) / 100"
        
        staminaTimer = Timer.scheduledTimer(timeInterval: 3,
                                            target: self,
                                            selector: #selector(updateStaminaValue),
                                            userInfo: nil,
                                            repeats: true)
        staminaTimer.fire()
    }
    
        @IBAction func toBattle(){
            //スタミナが50以上あればスタミナ50を消費して戦闘へ
            if stamina >= 50 {
                stamina -= 50
                staminaLabel.text = "\(stamina) / 100"
                performSegue(withIdentifier: "toBattle", sender: nil)
            }else{
    /*
                let alert: UIAlertController = UIAlertController(
                    title: "バトルには行けません！",
                    message: "スタミナを貯めてください",
                    prefferedStyle: .alert)
     */
                let alert: UIAlertController = UIAlertController(
                    title: "バトルには行けません",
                    message: "スタミナを貯めてください！",
                    preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
            
        }
        
        @objc func updateStaminaValue() {
            if stamina < 100 {
                stamina += 1
                staminaLabel.text = "\(stamina) / 100"
            }
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
