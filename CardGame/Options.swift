//
//  Options.swift
//  CardGame
//
//  Created by Buğra Akgün on 2.10.2025.
//

import UIKit

var eventarr = [Events]()
var optionarr = [OptionsClass]()
var badoptionarr = [OptionsClass]()

class Options: UIViewController {

    @IBOutlet weak var eventimage: UIImageView!
    
    @IBOutlet weak var eventdescription: UILabel!
    
    
    @IBOutlet weak var option2: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true

        //events
        let event1 = Events(eventnumber: 1, eventdescription: "Found a treasure. Choose your reward!", eventimage: UIImage(named: "treasureevent")!)
        let event2 = Events(eventnumber: 2, eventdescription: "You try to run away but you drop something", eventimage: UIImage(named: "seamonsterevent")!)
        
        
        eventarr.append(event1)
        eventarr.append(event2)
        
        //good options
        let options1 = OptionsClass(optionnumber: 1, optiondescription: "Get 100 Health")
        let options2 = OptionsClass(optionnumber: 2, optiondescription: "Give 3 Curse to Enemy")
        let options3 = OptionsClass(optionnumber: 3, optiondescription: "Get 100 Gold")
        let option4 = OptionsClass(optionnumber: 4, optiondescription: "Get Random Card")
        let option5 = OptionsClass(optionnumber: 5, optiondescription: "Give 10 Power to a Random Card")
        
        optionarr.append(options1)
        optionarr.append(options2)
        optionarr.append(options3)
        optionarr.append(option4)
        optionarr.append(option5)
        
        //bad options
        let boptions1 = OptionsClass(optionnumber: 1, optiondescription: "Lose 40 Health")
        let boptions2 = OptionsClass(optionnumber: 2, optiondescription: "Enemies Get 2 Power Next Turn")
        let boptions3 = OptionsClass(optionnumber: 3, optiondescription: "Lose 100 Gold")
        let boptions4 = OptionsClass(optionnumber: 4, optiondescription: "Discard a random card from deck")
        let boptions5 = OptionsClass(optionnumber: 5, optiondescription: "Decrease 10 Power Random Card")
        
        badoptionarr.append(boptions1)
        badoptionarr.append(boptions2)
        badoptionarr.append(boptions3)
        badoptionarr.append(boptions4)
        badoptionarr.append(boptions5)
        
        
        chooseevent()
    }
    
    
    
    func chooseevent(){
        eventarr.shuffle()
        optionarr.shuffle()
        badoptionarr.shuffle()
        eventimage.image = eventarr[0].image
        eventdescription.text = eventarr[0].description
        if eventarr[0].number == 1{
            option2.text = optionarr[1].description
        }
        if eventarr[0].number == 2{
            option2.text = badoptionarr[1].description
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
    
    @IBAction func button2tapped(_ sender: Any) {
        if eventarr[0].number == 1{
            if optionarr[1].number == 1{
                Gameplay.playerhealthvar += 100
                navigationController?.popViewController(animated: true)
            }
            if optionarr[1].number == 3{
                Gameplay.gold += 100
                navigationController?.popViewController(animated: true)
            }
             if optionarr[1].number == 2{
                Gameplay.varcursecounter += 3
                navigationController?.popViewController(animated: true)
            }
            if optionarr[1].number == 4{
                CardDatabase.shared.carddatabase.shuffle()
                if let gameplayVC = navigationController?.viewControllers.first(where: { $0 is Gameplay }) as? Gameplay {
                    CardDatabase.shared.carddatabase[0].power += Gameplay.upgradepower
                    gameplayVC.cardarr.append(CardDatabase.shared.carddatabase[0])
                    Gameplay.totalbuyedcards += 1
                }
                Gameplay.cardid += 1
                navigationController?.popViewController(animated: true)
            }
            if optionarr[1].number == 5{
                if let gameplayVC = navigationController?.viewControllers.first(where: { $0 is Path }) as? Path {
                    let random = Int.random(in: 0...gameplayVC.cardarr.count)
                    for i in random..<gameplayVC.cardarr.count {
                                    gameplayVC.cardarr[i].power += 10
                                    break
                            }
                }
                navigationController?.popViewController(animated: true)
            }
        }
        if eventarr[0].number == 2{
            if badoptionarr[1].number == 1{
                Gameplay.playerhealthvar -= 40
                navigationController?.popViewController(animated: true)
            }
            if badoptionarr[1].number == 3{
                Gameplay.gold -= 100
                navigationController?.popViewController(animated: true)
            }
             if badoptionarr[1].number == 2{
                 Gameplay.badeventdamage += 2
                navigationController?.popViewController(animated: true)
            }
            if badoptionarr[1].number == 4{
                if let gameplayVC = navigationController?.viewControllers.first(where: { $0 is Path }) as? Path {
                    if !gameplayVC.cardarr.isEmpty {
                        let randomIndex = Int.random(in: 0..<gameplayVC.cardarr.count)
                        gameplayVC.cardarr.remove(at: randomIndex)
                    }
                }

                navigationController?.popViewController(animated: true)
            }
            if badoptionarr[1].number == 5{
                if let gameplayVC = navigationController?.viewControllers.first(where: { $0 is Path }) as? Path {
                    let random = Int.random(in: 0...gameplayVC.cardarr.count)
                    for i in random..<gameplayVC.cardarr.count {
                                    gameplayVC.cardarr[i].power -= 10
                        if gameplayVC.cardarr[i].power <= 0{
                            gameplayVC.cardarr[i].power = 0
                        }
                                    break
                            }
                }
                navigationController?.popViewController(animated: true)
            }
        }
        
    }
    

    
}
