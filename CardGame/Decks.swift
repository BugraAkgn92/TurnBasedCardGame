//
//  Decks.swift
//  CardGame
//
//  Created by Buğra Akgün on 11.09.2025.
//

import UIKit

class Decks: UIViewController  {
    

    @IBOutlet weak var firstdeck: UIImageView!
    
    @IBOutlet weak var seconddeck: UIImageView!
    
    @IBOutlet weak var thirddeck: UIImageView!
    
    @IBOutlet weak var fourthdeck: UIImageView!
    
    @IBOutlet weak var fifthdeck: UIImageView!
    
    
    var deckarr = [Cards]()
    
    var selecteddeckimage: UIImage?
    
    var selectedlogo : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deckchoose()
        
        

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Gameplay.ampcounter = 0
        Gameplay.gold = 0
        Gameplay.varcursecounter = 0
        Gameplay.badeventdamage = 0
        
        Gameplay.hurt = 15
        
        Gameplay.cardid = 7
        
        Gameplay.upgradepower = 0
        Gameplay.totalbuyedcards = 0
        Gameplay.playerhealthvar = 100
        
        Gameplay.playershield = 0
        
        Gameplay.basemana = 10
        
        deckarr.removeAll()
    }
    
    func deckchoose(){
        firstdeck.isUserInteractionEnabled = true
        seconddeck.isUserInteractionEnabled = true
        thirddeck.isUserInteractionEnabled = true
        fourthdeck.isUserInteractionEnabled = true
        fifthdeck.isUserInteractionEnabled = true
        
        
        let firstdecktap = UITapGestureRecognizer(target: self, action: #selector(firstdeckpressed))
        firstdeck.addGestureRecognizer(firstdecktap)
        
        let seconddecktap = UITapGestureRecognizer(target: self, action: #selector(seconddeckpressed))
        seconddeck.addGestureRecognizer(seconddecktap)
        
        let thirddecktap = UITapGestureRecognizer(target: self, action: #selector(thirddeckpressed))
        thirddeck.addGestureRecognizer(thirddecktap)
        
        let fourthdecktap = UITapGestureRecognizer(target: self, action: #selector(fourthdeckpressed))
        fourthdeck.addGestureRecognizer(fourthdecktap)
        
        let fifthdecktap = UITapGestureRecognizer(target: self, action: #selector(fifthdeckpressed))
        fifthdeck.addGestureRecognizer(fifthdecktap)
        
        
    }
    
    @objc func firstdeckpressed(){
        selecteddeckimage = firstdeck.image
        let wizard = Cards(cardname: "Wizard", cardpower: 80, cardcost: 5, cardimage: UIImage(named: "wizard")!, carddescription: "All of this start with his curiosity",cardlogo: UIImage(named: "wizardlogo")!,cardprice: 100,cardtype: 1 ,cardspecial: 0,cardid: 5)
        let dragon = Cards(cardname: "Little Dragon", cardpower: 35, cardcost: 2, cardimage: UIImage(named: "littledragon")!, carddescription: "Achooo!",cardlogo: UIImage(named: "wizardlogo")!,cardprice: 40,cardtype: 1 ,cardspecial: 0,cardid: 2)
        let fireball = Cards(cardname: "Fireball", cardpower: 15, cardcost: 1, cardimage: UIImage(named: "fireball")!, carddescription: "Big destructive fireball coming through to your face",cardlogo: UIImage(named: "wizardlogo")!,cardprice: 20,cardtype: 1 ,cardspecial: 0,cardid: 1)
        let wand = Cards(cardname: "Wand", cardpower: 55, cardcost: 3, cardimage: UIImage(named: "wand")!, carddescription: "Trustworthy ally",cardlogo: UIImage(named: "wizardlogo")!,cardprice: 60,cardtype: 1 ,cardspecial: 0,cardid: 3)
        let spellbook = Cards(cardname: "Spellbook", cardpower: 70, cardcost: 4, cardimage: UIImage(named: "spellbook")!, carddescription: "Assime Gutta",cardlogo: UIImage(named: "wizardlogo")!,cardprice: 80,cardtype: 1 ,cardspecial: 0,cardid: 4)
        let godofspells = Cards(cardname: "God of Spells", cardpower: 110, cardcost: 7, cardimage: UIImage(named: "godofspells")!, carddescription: "EVERYTHING IS POSSIBLE",cardlogo: UIImage(named: "wizardlogo")!,cardprice: 140,cardtype: 1 ,cardspecial: 0,cardid: 6)
        deckarr.append(wizard)
        deckarr.append(dragon)
        deckarr.append(fireball)
        deckarr.append(wand)
        deckarr.append(spellbook)
        deckarr.append(godofspells)
        selectedlogo = deckarr[0].logo
        performSegue(withIdentifier: "toPath", sender: self)
    }
    
    @objc func seconddeckpressed(){
        selecteddeckimage = seconddeck.image
        let darklord = Cards(cardname: "Dark Lord", cardpower: 80, cardcost: 5, cardimage: UIImage(named: "darklord")!, carddescription: "She's waiting for her time to arise!",cardlogo: UIImage(named: "darklordlogo")!,cardprice: 100, cardtype: 2 ,cardspecial: 0,cardid: 5)
        let runningdwarf = Cards(cardname: "Running Dwarf", cardpower: 15, cardcost: 1, cardimage: UIImage(named: "runningdwarf")!, carddescription: "If we don't give the power within us willingly, it will come and take it ",cardlogo: UIImage(named: "darklordlogo")!,cardprice: 20, cardtype: 2 ,cardspecial: 0,cardid: 1)
        let messenger = Cards(cardname: "Messenger", cardpower: 35, cardcost: 2, cardimage: UIImage(named: "messenger")!, carddescription: "I FOUND HIM!",cardlogo: UIImage(named: "darklordlogo")!,cardprice: 40, cardtype: 2 ,cardspecial: 0,cardid: 2)
        let followers = Cards(cardname: "Followers", cardpower: 55, cardcost: 3, cardimage: UIImage(named: "followers")!, carddescription: "Even after those days, there are still people who follow my path",cardlogo: UIImage(named: "darklordlogo")!,cardprice: 60, cardtype: 2 ,cardspecial: 0,cardid: 3)
        let assistant = Cards(cardname: "Assistant", cardpower: 70, cardcost: 4, cardimage: UIImage(named: "assistant")!, carddescription: "As you wish my Lord",cardlogo: UIImage(named: "darklordlogo")!,cardprice: 80, cardtype: 2 ,cardspecial: 0,cardid: 4)
        let transformation = Cards(cardname: "Transformation", cardpower: 110, cardcost: 7, cardimage: UIImage(named: "transformation")!, carddescription: "Take from the little ones and give to the big ones",cardlogo: UIImage(named: "darklordlogo")!,cardprice: 140, cardtype: 2 ,cardspecial: 0,cardid: 6)
        
        
        deckarr.append(darklord)
        deckarr.append(runningdwarf)
        deckarr.append(messenger)
        deckarr.append(followers)
        deckarr.append(assistant)
        deckarr.append(transformation)
        selectedlogo = deckarr[0].logo
        
        performSegue(withIdentifier: "toPath", sender: self)
    }
    
    @objc func thirddeckpressed(){
        selecteddeckimage = thirddeck.image
        let forgottenone = Cards(cardname: "Forgotten One", cardpower: 110, cardcost: 7, cardimage: UIImage(named: "forgottenone")! , carddescription: "They abandoned their greatest heroes under the sea for peace",cardlogo: UIImage(named: "giantslogo")!,cardprice: 140, cardtype: 3 ,cardspecial: 0,cardid: 6)
        let intruder = Cards(cardname: "Intruder", cardpower: 15, cardcost: 1, cardimage: UIImage(named: "intruder")! , carddescription: "You really need to explain how you got there",cardlogo: UIImage(named: "giantslogo")!,cardprice: 20, cardtype: 3 ,cardspecial: 0,cardid: 1)
        let miners = Cards(cardname: "Miners", cardpower: 35, cardcost: 2, cardimage: UIImage(named: "miners")! , carddescription: "If you are not smart enough to mine, you should not be here",cardlogo: UIImage(named: "giantslogo")!,cardprice: 40, cardtype: 3 ,cardspecial: 0,cardid: 2)
        let giantswords = Cards(cardname: "Giant Swords", cardpower: 55, cardcost: 3, cardimage: UIImage(named: "giantswords")! , carddescription: "They don't need any weapon but in case they do, they have plenty",cardlogo: UIImage(named: "giantslogo")!,cardprice: 60, cardtype: 3 ,cardspecial: 0,cardid: 3)
        let execute = Cards(cardname: "Execute", cardpower: 70, cardcost: 4, cardimage: UIImage(named: "execute")! , carddescription: "After the magic showed up giants need to move forbidden places",cardlogo: UIImage(named: "giantslogo")!,cardprice: 80, cardtype: 3 ,cardspecial: 0,cardid: 4)
        let oldones = Cards(cardname: "Old Ones", cardpower: 80, cardcost: 5, cardimage: UIImage(named: "oldones")! , carddescription: "The elderly do not seem to have forgotten the disaster",cardlogo: UIImage(named: "giantslogo")!,cardprice: 100, cardtype: 3 ,cardspecial: 0,cardid: 5)
        
        deckarr.append(forgottenone)
        deckarr.append(intruder)
        deckarr.append(miners)
        deckarr.append(giantswords)
        deckarr.append(execute)
        deckarr.append(oldones)
        selectedlogo = deckarr[0].logo
        
        
        performSegue(withIdentifier: "toPath", sender: self)
    }
    
    @objc func fourthdeckpressed() {
        selecteddeckimage = fourthdeck.image
        let dragonhead = Cards(cardname: "Dragon Head", cardpower: 3, cardcost: 1, cardimage: UIImage(named: "dragonhead")!, carddescription: "If the transformation rituals are not completed properly, you will suffer the consequences.", cardlogo: UIImage(named: "alchemistlogo")!, cardprice: 20, cardtype: 4, cardspecial: 2,cardid: 1)
        let cursebook = Cards(cardname: "Curse Book", cardpower: 4, cardcost: 2, cardimage: UIImage(named: "cursebook")!, carddescription: "One of the most dangerous of all books", cardlogo: UIImage(named: "alchemistlogo")!, cardprice: 40, cardtype: 4, cardspecial: 2,cardid: 2)
        let confusion = Cards(cardname: "Confusion", cardpower: 5, cardcost: 3, cardimage: UIImage(named: "confusion")!, carddescription: "In their minds they cannot understand anything", cardlogo: UIImage(named: "alchemistlogo")!, cardprice: 60, cardtype: 4, cardspecial: 2,cardid: 3)
        let soulsplit = Cards(cardname: "Soul Split", cardpower: 6, cardcost: 4, cardimage: UIImage(named: "soulsplit")!, carddescription: "Your soul cursed most miserable way", cardlogo: UIImage(named: "alchemistlogo")!, cardprice: 80, cardtype: 4, cardspecial: 2,cardid: 4)
        let eternalsleep = Cards(cardname: "Eternal Sleep", cardpower: 7, cardcost: 5, cardimage: UIImage(named: "eternalsleep")!, carddescription: "She sleeps so well that she turns into stone", cardlogo: UIImage(named: "alchemistlogo")!, cardprice: 100, cardtype: 4, cardspecial: 2,cardid: 5)
        let alchemist = Cards(cardname: "Alchemist", cardpower: 9, cardcost: 7, cardimage: UIImage(named: "alchemist")!, carddescription: "FATHER OF THE CURSES", cardlogo: UIImage(named: "alchemistlogo")!, cardprice: 140, cardtype: 4, cardspecial: 2,cardid: 6)
        
        
        
        deckarr.append(dragonhead)
        deckarr.append(cursebook)
        deckarr.append(confusion)
        deckarr.append(soulsplit)
        deckarr.append(eternalsleep)
        deckarr.append(alchemist)
        selectedlogo = deckarr[0].logo
        
        performSegue(withIdentifier: "toPath", sender: self)

    }
    
    @objc func fifthdeckpressed() {
        selecteddeckimage = fifthdeck.image
        
        let axe = Cards(cardname: "Axe", cardpower: 45, cardcost: 1, cardimage: UIImage(named: "axe")!, carddescription: "", cardlogo: UIImage(named:"vikingslogo")!, cardprice: 20, cardtype: 5, cardspecial: 4,cardid: 1)
        let barracks = Cards(cardname: "Barracks", cardpower: 65, cardcost: 2, cardimage: UIImage(named: "barracks")!, carddescription: "", cardlogo: UIImage(named:"vikingslogo")!, cardprice: 40, cardtype: 5, cardspecial: 4,cardid: 2)
        let horn = Cards(cardname: "Horn", cardpower: 85, cardcost: 3, cardimage: UIImage(named: "horn")!, carddescription: "", cardlogo: UIImage(named:"vikingslogo")!, cardprice: 60, cardtype: 5, cardspecial: 4,cardid: 3)
        let drakkar = Cards(cardname: "Drakkar", cardpower: 100, cardcost: 4, cardimage: UIImage(named: "drakkar")!, carddescription: "", cardlogo: UIImage(named:"vikingslogo")!, cardprice: 80, cardtype: 5, cardspecial: 4,cardid: 4)
        let warriors = Cards(cardname: "Warriors", cardpower: 110, cardcost: 5, cardimage: UIImage(named: "warriors")!, carddescription: "", cardlogo: UIImage(named:"vikingslogo")!, cardprice: 100, cardtype: 5, cardspecial: 4,cardid: 5)
        let thor = Cards(cardname: "Thor", cardpower: 140, cardcost: 7, cardimage: UIImage(named: "thor")!, carddescription: "", cardlogo: UIImage(named:"vikingslogo")!, cardprice: 140, cardtype: 5, cardspecial: 4,cardid: 6)
        
        deckarr.append(axe)
        deckarr.append(barracks)
        deckarr.append(horn)
        deckarr.append(drakkar)
        deckarr.append(warriors)
        deckarr.append(thor)
        selectedlogo = deckarr[0].logo
        
        
        performSegue(withIdentifier: "toPath", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPath" {
            if let destinationVC = segue.destination as? Path{
                destinationVC.cardarr = deckarr
                destinationVC.cardbackimage = selecteddeckimage
                destinationVC.characterlogopic = selectedlogo
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
