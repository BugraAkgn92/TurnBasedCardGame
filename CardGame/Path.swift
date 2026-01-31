//
//  Path.swift
//  CardGame
//
//  Created by Buğra Akgün on 19.10.2025.
//

import UIKit

class Path: UIViewController {

    @IBOutlet weak var characterlogo: UIImageView!
    
    @IBOutlet weak var enemy1logo: UIImageView!
    
    @IBOutlet weak var enemy2logo: UIImageView!
    
    @IBOutlet weak var enemy3logo: UIImageView!
    
    @IBOutlet weak var prize1: UIImageView!
    
    @IBOutlet weak var enemy4logo: UIImageView!
    
    @IBOutlet weak var enemy5logo: UIImageView!
    
    @IBOutlet weak var prize2: UIImageView!
    
    @IBOutlet weak var bosslogo: UIImageView!
    
    
    var cardarr = [Cards]()
    var cardbackimage: UIImage?
    var characterlogopic: UIImage?
    static var pathnumber : Int = 0
    
    static var enemylogoarr = [EnemyLogo]()
    
    static var gameplaylogopic : UIImage?
    
    static var pathlocked : Int =  0
    
    static var pathturn : Int = 0
    
    static var prizelocked : Int = 0
    
    static var pathampcounter : Int = 0
    
    static var gameplayenemyid : Int = 0
    
    var enemy1id : Int = 0
    var enemy2id : Int = 0
    var enemy3id : Int = 0
    var enemy4id : Int = 0
    var enemy5id : Int = 0
    var bossid : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        Gameplay.gameplayskillarr.removeAll()
        Path.enemylogoarr.removeAll()

        
        let cg = EnemyLogo(EnemyLogologo: UIImage(named: "corruptedgiantlogo")!, EnemyLogoid: 1)
        let kts = EnemyLogo(EnemyLogologo: UIImage(named: "kitsunelogo")!, EnemyLogoid: 2)
        let bldthrsty = EnemyLogo(EnemyLogologo: UIImage(named: "bloodthirstydwarflogo")!, EnemyLogoid: 3)
        let dpwtr = EnemyLogo(EnemyLogologo: UIImage(named: "deepwatercreaturelogo")!, EnemyLogoid: 4)
        let shpshftr = EnemyLogo(EnemyLogologo: UIImage(named: "shapeshifterlogo")!, EnemyLogoid: 5)
        
        Path.enemylogoarr.append(cg)
        Path.enemylogoarr.append(kts)
        Path.enemylogoarr.append(bldthrsty)
        Path.enemylogoarr.append(dpwtr)
        Path.enemylogoarr.append(shpshftr)

        if let logopic = characterlogopic {
                characterlogo.image = logopic
            }
        Path.pathturn = 0
        restart()
        Path.pathnumber = 0
        pathunlocked()
        
        
    }
    
   override func viewWillAppear(_ animated: Bool) {
       Path.pathampcounter = Gameplay.ampcounter
        pathunlocked()
    }
    
    
    func restart() {
        Path.enemylogoarr.shuffle()
        Path.pathnumber = -1
        Path.pathlocked = 0
        Path.prizelocked = 0
        
        let logos: [UIImageView] = [
               enemy1logo, enemy2logo, enemy3logo,
               enemy4logo, enemy5logo, bosslogo,
               prize1, prize2
           ]
           
           for logo in logos {
               logo.image = nil
               logo.isUserInteractionEnabled = false
           }
           
           
           if let logopic = characterlogopic {
               characterlogo.image = logopic
           }
    }
    
    func pathunlocked() {
        if Path.enemylogoarr.count > 0 && Path.pathnumber >= 0 {
            enemy1logo.image = Path.enemylogoarr[0].logo
            enemy1id = Path.enemylogoarr[0].id
            enemy1logo.isUserInteractionEnabled = true
            if Path.pathlocked > 0{
                enemy1logo.isUserInteractionEnabled = false
            }
        }

        if Path.enemylogoarr.count > 1 && Path.pathnumber >= 1 {
            enemy2logo.image = Path.enemylogoarr[1].logo
            enemy2id = Path.enemylogoarr[1].id
            enemy2logo.isUserInteractionEnabled = true
            if Path.pathlocked > 1{
                enemy2logo.isUserInteractionEnabled = false
            }
        }
        if Path.enemylogoarr.count > 2 && Path.pathnumber >= 2 {
            enemy3logo.image = Path.enemylogoarr[2].logo
            enemy3id = Path.enemylogoarr[2].id
            enemy3logo.isUserInteractionEnabled = true
            if Path.pathlocked > 2{
                enemy3logo.isUserInteractionEnabled = false
            }
        }
        if Path.enemylogoarr.count > 3 && Path.pathnumber >= 3 {
            enemy4logo.image = Path.enemylogoarr[3].logo
            enemy4id = Path.enemylogoarr[3].id
            prize1.image = UIImage(named: "treasurelogo")!
            enemy4logo.isUserInteractionEnabled = true
            prize1.isUserInteractionEnabled = true
            if Path.pathlocked > 3{
                enemy4logo.isUserInteractionEnabled = false
            }
            if Path.prizelocked > 0{
                prize1.isUserInteractionEnabled = false
            }
            
        }
        if Path.enemylogoarr.count > 4 && Path.pathnumber >= 4 {
            enemy5logo.image = Path.enemylogoarr[4].logo
            enemy5id = Path.enemylogoarr[4].id
            enemy5logo.isUserInteractionEnabled = true
            if Path.pathlocked > 4{
                enemy5logo.isUserInteractionEnabled = false
            }
        }
        if Path.enemylogoarr.count > 4 && Path.pathnumber >= 5 {
            prize2.image = UIImage(named: "treasurelogo")!
            prize2.isUserInteractionEnabled = true
            if Path.prizelocked > 1{
                prize2.isUserInteractionEnabled = false
            }
        }
        if Path.enemylogoarr.count > 4 && Path.pathnumber >= 6 {
            bosslogo.image = Path.enemylogoarr[0].logo
            bossid = Path.enemylogoarr[0].id
            bosslogo.isUserInteractionEnabled = true
            if Path.pathlocked > 5{
                enemy5logo.isUserInteractionEnabled = false
            }
        }
        
        let firstlogotap = UITapGestureRecognizer(target: self, action: #selector(firstlogopressed))
        enemy1logo.addGestureRecognizer(firstlogotap)
        
        let secondlogotap = UITapGestureRecognizer(target: self, action: #selector(secondlogopressed))
        enemy2logo.addGestureRecognizer(secondlogotap)
        
        let thirdlogotap = UITapGestureRecognizer(target: self, action: #selector(thirdlogopressed))
        enemy3logo.addGestureRecognizer(thirdlogotap)
        
        let fourthlogotap = UITapGestureRecognizer(target: self, action: #selector(fourthlogopressed))
        enemy4logo.addGestureRecognizer(fourthlogotap)
        
        let fifthlogotap = UITapGestureRecognizer(target: self, action: #selector(fifthlogopressed))
        enemy5logo.addGestureRecognizer(fifthlogotap)
        
        let prize1tap = UITapGestureRecognizer(target: self, action: #selector(prize1pressed))
        prize1.addGestureRecognizer(prize1tap)
        
        let prize2tap = UITapGestureRecognizer(target: self, action: #selector(prize2pressed))
        prize2.addGestureRecognizer(prize2tap)
        
        let bosslogotap = UITapGestureRecognizer(target: self, action: #selector(bosslogopressed))
        bosslogo.addGestureRecognizer(bosslogotap)
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    
    @objc func firstlogopressed(){
        Path.gameplaylogopic = enemy1logo.image
        Path.gameplayenemyid = enemy1id
        Path.pathlocked += 1
        Path.pathturn += 1
        performSegue(withIdentifier: "toGameplay", sender: self)
        
    }
    
    @objc func secondlogopressed(){
        Path.gameplaylogopic = enemy2logo.image
        Path.gameplayenemyid = enemy2id
        Path.pathlocked += 1
        Path.pathturn += 1
        performSegue(withIdentifier: "toGameplay", sender: self)
        
    }
    @objc func thirdlogopressed(){
        Path.gameplaylogopic = enemy3logo.image
        Path.gameplayenemyid = enemy3id
        Path.pathlocked += 1
        Path.pathturn += 1
        performSegue(withIdentifier: "toGameplay", sender: self)
        
    }
    @objc func fourthlogopressed(){
        Path.gameplaylogopic = enemy4logo.image
        Path.gameplayenemyid = enemy4id
        Path.pathlocked += 1
        Path.pathturn += 1
        performSegue(withIdentifier: "toGameplay", sender: self)
        
    }
    @objc func fifthlogopressed(){
        Path.gameplaylogopic = enemy5logo.image
        Path.gameplayenemyid = enemy5id
        Path.pathlocked += 1
        Path.pathturn += 1
        performSegue(withIdentifier: "toGameplay", sender: self)
        
    }
    @objc func prize1pressed(){
        prize1.isUserInteractionEnabled = false
        Path.prizelocked += 1
        let nextScene = Int.random(in: 1...13)
        if nextScene <= 8  {
           
                performSegue(withIdentifier: "toSkills", sender: self)
                
            
        }else if (nextScene == 9 || nextScene == 10)  {
           
            performSegue(withIdentifier: "toShop", sender: self)
            
        }else if nextScene == 11  {
           
            performSegue(withIdentifier: "toDelete", sender: self)
            
        }else if (nextScene == 12 || nextScene == 13)  {
           
            performSegue(withIdentifier: "toOptions", sender: self)
            
        }
        
    }
    @objc func prize2pressed(){
        prize2.isUserInteractionEnabled = false
        Path.prizelocked += 1
        Path.pathlocked += 1
        Path.pathnumber += 1
        let nextScene = Int.random(in: 1...13)
        if nextScene <= 8  {
           
                performSegue(withIdentifier: "toSkills", sender: self)
                
            
        }else if (nextScene == 9 || nextScene == 10)  {
           
            performSegue(withIdentifier: "toShop", sender: self)
            
        }else if nextScene == 11  {
           
            performSegue(withIdentifier: "toDelete", sender: self)
            
        }else if (nextScene == 12 || nextScene == 13)  {
           
            performSegue(withIdentifier: "toOptions", sender: self)
            
        }

        
    }
    @objc func bosslogopressed(){
        Path.gameplaylogopic = bosslogo.image
        Path.gameplayenemyid = bossid
        restart()
        performSegue(withIdentifier: "toGameplay", sender: self)
        
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGameplay" {
            if let destinationVC = segue.destination as? Gameplay{
                destinationVC.cardarr = cardarr
                destinationVC.cardbackimage = cardbackimage
            }
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
