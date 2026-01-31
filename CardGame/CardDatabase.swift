import UIKit

class CardDatabase {
    static let shared = CardDatabase()
    
    private init() {
        setupCards()
    }
    
    var carddatabase = [Cards]()
    
    private func setupCards() {
        
        
        //Wizard
        let wizard = Cards(cardname: "Wizard", cardpower: 80, cardcost: 5, cardimage: UIImage(named: "wizard")!, carddescription: "All of this start with his curiosity",cardlogo: UIImage(named: "wizardlogo")!,cardprice: 100,cardtype: 1 ,cardspecial: 0,cardid: Gameplay.cardid)
        let dragon = Cards(cardname: "Little Dragon", cardpower: 35, cardcost: 2, cardimage: UIImage(named: "littledragon")!, carddescription: "Achooo!",cardlogo: UIImage(named: "wizardlogo")!,cardprice: 40,cardtype: 1 ,cardspecial: 0,cardid: Gameplay.cardid)
        let fireball = Cards(cardname: "Fireball", cardpower: 15, cardcost: 1, cardimage: UIImage(named: "fireball")!, carddescription: "Big destructive fireball coming through to your face",cardlogo: UIImage(named: "wizardlogo")!,cardprice: 20,cardtype: 1 ,cardspecial: 0,cardid: Gameplay.cardid)
        let wand = Cards(cardname: "Wand", cardpower: 55, cardcost: 3, cardimage: UIImage(named: "wand")!, carddescription: "Trustworthy ally",cardlogo: UIImage(named: "wizardlogo")!,cardprice: 60,cardtype: 1 ,cardspecial: 0,cardid: Gameplay.cardid)
        let spellbook = Cards(cardname: "Spellbook", cardpower: 70, cardcost: 4, cardimage: UIImage(named: "spellbook")!, carddescription: "Assime Gutta",cardlogo: UIImage(named: "wizardlogo")!,cardprice: 80,cardtype: 1 ,cardspecial: 0,cardid: Gameplay.cardid)
        let godofspells = Cards(cardname: "God of Spells", cardpower: 110, cardcost: 7, cardimage: UIImage(named: "godofspells")!, carddescription: "EVERYTHING IS POSSIBLE",cardlogo: UIImage(named: "wizardlogo")!,cardprice: 140,cardtype: 1 ,cardspecial: 0,cardid: Gameplay.cardid)
               carddatabase.append(wizard)
               carddatabase.append(dragon)
               carddatabase.append(fireball)
               carddatabase.append(wand)
               carddatabase.append(spellbook)
               carddatabase.append(godofspells)
           
        
        //Dark Lord
        let darklord = Cards(cardname: "Dark Lord", cardpower: 80, cardcost: 5, cardimage: UIImage(named: "darklord")!, carddescription: "She's waiting for her time to arise!",cardlogo: UIImage(named: "darklordlogo")!,cardprice: 100, cardtype: 2 ,cardspecial: 0,cardid: Gameplay.cardid)
        let runningdwarf = Cards(cardname: "Running Dwarf", cardpower: 15, cardcost: 1, cardimage: UIImage(named: "runningdwarf")!, carddescription: "If we don't give the power within us willingly, it will come and take it ",cardlogo: UIImage(named: "darklordlogo")!,cardprice: 20, cardtype: 2 ,cardspecial: 0,cardid: Gameplay.cardid)
        let messenger = Cards(cardname: "Messenger", cardpower: 35, cardcost: 2, cardimage: UIImage(named: "messenger")!, carddescription: "I FOUND HIM!",cardlogo: UIImage(named: "darklordlogo")!,cardprice: 40, cardtype: 2 ,cardspecial: 0,cardid: Gameplay.cardid)
        let followers = Cards(cardname: "Followers", cardpower: 55, cardcost: 3, cardimage: UIImage(named: "followers")!, carddescription: "Even after those days, there are still people who follow my path",cardlogo: UIImage(named: "darklordlogo")!,cardprice: 60, cardtype: 2 ,cardspecial: 0,cardid: Gameplay.cardid)
        let assistant = Cards(cardname: "Assistant", cardpower: 70, cardcost: 4, cardimage: UIImage(named: "assistant")!, carddescription: "As you wish my Lord",cardlogo: UIImage(named: "darklordlogo")!,cardprice: 80, cardtype: 2 ,cardspecial: 0,cardid: Gameplay.cardid)
        let transformation = Cards(cardname: "Transformation", cardpower: 110, cardcost: 7, cardimage: UIImage(named: "transformation")!, carddescription: "Take from the little ones and give to the big ones",cardlogo: UIImage(named: "darklordlogo")!,cardprice: 140, cardtype: 2 ,cardspecial: 0,cardid: Gameplay.cardid)
               
               
               carddatabase.append(darklord)
               carddatabase.append(runningdwarf)
               carddatabase.append(messenger)
               carddatabase.append(followers)
               carddatabase.append(assistant)
               carddatabase.append(transformation)
               
        
        //Giants
        let forgottenone = Cards(cardname: "Forgotten One", cardpower: 110, cardcost: 7, cardimage: UIImage(named: "forgottenone")! , carddescription: "They abandoned their greatest heroes under the sea for peace",cardlogo: UIImage(named: "giantslogo")!,cardprice: 140, cardtype: 3 ,cardspecial: 0,cardid: Gameplay.cardid)
        let intruder = Cards(cardname: "Intruder", cardpower: 15, cardcost: 1, cardimage: UIImage(named: "intruder")! , carddescription: "You really need to explain how you got there",cardlogo: UIImage(named: "giantslogo")!,cardprice: 20, cardtype: 3 ,cardspecial: 0,cardid: Gameplay.cardid)
        let miners = Cards(cardname: "Miners", cardpower: 35, cardcost: 2, cardimage: UIImage(named: "miners")! , carddescription: "If you are not smart enough to mine, you should not be here",cardlogo: UIImage(named: "giantslogo")!,cardprice: 40, cardtype: 3 ,cardspecial: 0,cardid: Gameplay.cardid)
        let giantswords = Cards(cardname: "Giant Swords", cardpower: 55, cardcost: 3, cardimage: UIImage(named: "giantswords")! , carddescription: "They don't need any weapon but in case they do, they have plenty",cardlogo: UIImage(named: "giantslogo")!,cardprice: 60, cardtype: 3 ,cardspecial: 0,cardid: Gameplay.cardid)
        let execute = Cards(cardname: "Execute", cardpower: 70, cardcost: 4, cardimage: UIImage(named: "execute")! , carddescription: "After the magic showed up giants need to move forbidden places",cardlogo: UIImage(named: "giantslogo")!,cardprice: 80, cardtype: 3 ,cardspecial: 0,cardid: Gameplay.cardid)
        let oldones = Cards(cardname: "Old Ones", cardpower: 80, cardcost: 5, cardimage: UIImage(named: "oldones")! , carddescription: "The elderly do not seem to have forgotten the disaster",cardlogo: UIImage(named: "giantslogo")!,cardprice: 100, cardtype: 3 ,cardspecial: 0,cardid: Gameplay.cardid)
               carddatabase.append(forgottenone)
               carddatabase.append(intruder)
               carddatabase.append(miners)
               carddatabase.append(giantswords)
               carddatabase.append(execute)
               carddatabase.append(oldones)
        
        
        //Alchemist
        
        let dragonhead = Cards(cardname: "Dragon Head", cardpower: 3, cardcost: 1, cardimage: UIImage(named: "dragonhead")!, carddescription: "If the transformation rituals are not completed properly, you will suffer the consequences.", cardlogo: UIImage(named: "alchemistlogo")!, cardprice: 20, cardtype: 4, cardspecial: 2,cardid: Gameplay.cardid)
        let cursebook = Cards(cardname: "Curse Book", cardpower: 4, cardcost: 2, cardimage: UIImage(named: "cursebook")!, carddescription: "One of the most dangerous of all books", cardlogo: UIImage(named: "alchemistlogo")!, cardprice: 40, cardtype: 4, cardspecial: 2,cardid: Gameplay.cardid)
        let confusion = Cards(cardname: "Confusion", cardpower: 5, cardcost: 3, cardimage: UIImage(named: "confusion")!, carddescription: "In their minds they cannot understand anything", cardlogo: UIImage(named: "alchemistlogo")!, cardprice: 60, cardtype: 4, cardspecial: 2,cardid: Gameplay.cardid)
        let soulsplit = Cards(cardname: "Soul Split", cardpower: 6, cardcost: 4, cardimage: UIImage(named: "soulsplit")!, carddescription: "Your soul cursed most miserable way", cardlogo: UIImage(named: "alchemistlogo")!, cardprice: 80, cardtype: 4, cardspecial: 2,cardid: Gameplay.cardid)
        let eternalsleep = Cards(cardname: "Eternal Sleep", cardpower: 7, cardcost: 5, cardimage: UIImage(named: "eternalsleep")!, carddescription: "She sleeps so well that she turns into stone", cardlogo: UIImage(named: "alchemistlogo")!, cardprice: 100, cardtype: 4, cardspecial: 2,cardid: Gameplay.cardid)
        let alchemist = Cards(cardname: "Alchemist", cardpower: 9, cardcost: 7, cardimage: UIImage(named: "alchemist")!, carddescription: "FATHER OF THE CURSES", cardlogo: UIImage(named: "alchemistlogo")!, cardprice: 140, cardtype: 4, cardspecial: 2,cardid: Gameplay.cardid)
        
        carddatabase.append(dragonhead)
        carddatabase.append(cursebook)
        carddatabase.append(confusion)
        carddatabase.append(soulsplit)
        carddatabase.append(eternalsleep)
        carddatabase.append(alchemist)
        
        
        //Vikings
        let axe = Cards(cardname: "Axe", cardpower: 45, cardcost: 1, cardimage: UIImage(named: "axe")!, carddescription: "", cardlogo: UIImage(named:"vikingslogo")!, cardprice: 20, cardtype: 5, cardspecial: 4,cardid: Gameplay.cardid)
        let barracks = Cards(cardname: "Barracks", cardpower: 65, cardcost: 2, cardimage: UIImage(named: "barracks")!, carddescription: "", cardlogo: UIImage(named:"vikingslogo")!, cardprice: 40, cardtype: 5, cardspecial: 4,cardid: Gameplay.cardid)
        let horn = Cards(cardname: "Horn", cardpower: 85, cardcost: 3, cardimage: UIImage(named: "horn")!, carddescription: "", cardlogo: UIImage(named:"vikingslogo")!, cardprice: 60, cardtype: 5, cardspecial: 4,cardid: Gameplay.cardid)
        let drakkar = Cards(cardname: "Drakkar", cardpower: 100, cardcost: 4, cardimage: UIImage(named: "drakkar")!, carddescription: "", cardlogo: UIImage(named:"vikingslogo")!, cardprice: 80, cardtype: 5, cardspecial: 4,cardid: Gameplay.cardid)
        let warriors = Cards(cardname: "Warriors", cardpower: 110, cardcost: 5, cardimage: UIImage(named: "warriors")!, carddescription: "", cardlogo: UIImage(named:"vikingslogo")!, cardprice: 100, cardtype: 5, cardspecial: 4,cardid: Gameplay.cardid)
        let thor = Cards(cardname: "Thor", cardpower: 140, cardcost: 7, cardimage: UIImage(named: "thor")!, carddescription: "", cardlogo: UIImage(named:"vikingslogo")!, cardprice: 140, cardtype: 5, cardspecial: 4,cardid: Gameplay.cardid)
        
        carddatabase.append(axe)
        carddatabase.append(barracks)
        carddatabase.append(horn)
        carddatabase.append(drakkar)
        carddatabase.append(warriors)
        carddatabase.append(thor)
        
        
        
        
        
        
        //Random Cards
        let timetraveler = Cards(cardname: "Time Traveler", cardpower: 200, cardcost: 4, cardimage: UIImage(named: "timetraveler")!, carddescription: "There are always consequences.", cardlogo: UIImage(named: "randomlogo")!, cardprice: 80, cardtype: 0 ,cardspecial: 0,cardid: Gameplay.cardid)
        let swimminggoblin = Cards(cardname: "Swimming Goblin", cardpower: 30, cardcost: 1, cardimage: UIImage(named: "swimminggoblin")!, carddescription: "At least she adapted somehow", cardlogo: UIImage(named: "randomlogo")!,cardprice: 20, cardtype: 0 ,cardspecial: 0,cardid: Gameplay.cardid)
        let peacefuldemon = Cards(cardname: "Peaceful Demon", cardpower: 70, cardcost: 2, cardimage: UIImage(named: "peacefuldemon")!, carddescription: "Not all demons are bad", cardlogo: UIImage(named: "randomlogo")!, cardprice: 40, cardtype: 0 ,cardspecial: 0,cardid: Gameplay.cardid)
        let hopelessknight = Cards(cardname: "Hopeless Knight", cardpower: 120, cardcost: 3, cardimage: UIImage(named: "hopelessknight")!, carddescription: "There is nothing in this land that he can perceive", cardlogo: UIImage(named: "randomlogo")!, cardprice: 60, cardtype: 0 ,cardspecial: 0,cardid: Gameplay.cardid)
        let experiments = Cards(cardname: "Experiments", cardpower: 18, cardcost: 4, cardimage: UIImage(named: "experiments")!, carddescription: "Some alchemists only dream is to turn anything into gold.", cardlogo: UIImage(named:"randomlogo")!, cardprice: 80, cardtype: 0, cardspecial: 2,cardid: Gameplay.cardid)
        let battlehealer = Cards(cardname: "Battle Healer", cardpower: 100, cardcost: 5, cardimage: UIImage(named: "battlehealer")!, carddescription: "", cardlogo: UIImage(named: "randomlogo")!, cardprice: 100, cardtype: 0, cardspecial: 3,cardid: Gameplay.cardid)
        let bloodmage = Cards(cardname: "Blood Mage", cardpower: 250, cardcost: 5, cardimage: UIImage(named: "bloodmage")!, carddescription: "", cardlogo: UIImage(named: "randomlogo")!, cardprice: 100, cardtype: 0, cardspecial: 4,cardid: Gameplay.cardid)
        
        
        carddatabase.append(timetraveler)
        carddatabase.append(swimminggoblin)
        carddatabase.append(peacefuldemon)
        carddatabase.append(hopelessknight)
        carddatabase.append(experiments)
        carddatabase.append(battlehealer)
        carddatabase.append(bloodmage)
        
        
    }
}
