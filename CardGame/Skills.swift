//
//  Skills.swift
//  CardGame
//
//  Created by Buğra Akgün on 11.09.2025.
//

import UIKit



class Skills: UIViewController {
    @IBOutlet weak var Skill1: UIImageView!
    
    @IBOutlet weak var Skill2: UIImageView!
    
    @IBOutlet weak var SkillDesc1: UILabel!
    
    @IBOutlet weak var SkillDesc2: UILabel!
    
    @IBOutlet weak var ExitButton: UIButton!
    
    var skillarr = [SkillClass]()
    
    var skillevelmain = 1
    static var skillaction4 = 3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        skillarr.removeAll()
        
        
        let allSkills = [
            SkillClass(skillimage: UIImage(named: "spelldamage")!, skilldescription: "When you use a card deals 15 extra damage", skillname: "Spell Damage", skillevel: 1),
            SkillClass(skillimage: UIImage(named: "differentplaces")!, skilldescription: "Your deck gets one random card", skillname: "Different Places", skillevel: 1),
            SkillClass(skillimage: UIImage(named: "hearthofmana")!, skilldescription: "When you play a card deal and heal 3 times cards mana cost", skillname: "Hearth of Mana", skillevel: 1),
            SkillClass(skillimage: UIImage(named: "healmagic")!, skilldescription: "When you use a card heal 10", skillname: "Heal Magic", skillevel: 1),
            SkillClass(skillimage: UIImage(named: "littlehelp")!, skilldescription: "When you play a card cost 2 or less deal extra 30 damage", skillname: "Little Help", skillevel: 1),
            SkillClass(skillimage: UIImage(named:"shadowrises")!, skilldescription: "When you play a card from Dark Lord deal 8 heal 8", skillname: "Shadow Rises", skillevel: 1),
            SkillClass(skillimage: UIImage(named: "spellcombo")!, skilldescription: "If you play 3 Wizard card deal 50", skillname: "Spell Combo", skillevel: 1),
            SkillClass(skillimage: UIImage(named: "tougherthanever")!, skilldescription: "When you play a card from Giants gain 15 Shield", skillname: "Tougher Than Ever", skillevel: 1),
            SkillClass(skillimage: UIImage(named: "shieldmagic")!, skilldescription: "When you use a card shield 10", skillname: "Shield Magic", skillevel: 1),
            SkillClass(skillimage: UIImage(named: "attackingsafe")!, skilldescription: "When you play a card while you have shield deal 20", skillname: "Attacking Safe", skillevel: 1),
            SkillClass(skillimage: UIImage(named: "excellentdeal")!, skilldescription: "Deal damage 3 times the number of cards you added that are not in the deck(Added:\(Gameplay.totalbuyedcards)", skillname: "Excellent Deal", skillevel: 1),
            SkillClass(skillimage: UIImage(named: "moremisery")!, skilldescription: "When you kill an enemy enemy gets 1 curse", skillname: "More Misery", skillevel: 1),
            SkillClass(skillimage: UIImage(named: "healingcurse")!, skilldescription: "Heal 1 times of the curse", skillname: "Healing Curse", skillevel: 1),
            SkillClass(skillimage: UIImage(named: "hurtingmore")!, skilldescription: "When you play a Hurt Card first deal 5 yourself and deal 30 to the enemy", skillname: "Hurting More", skillevel: 1),
            SkillClass(skillimage: UIImage(named: "upgrade")!, skilldescription: "When you add a card to your deck that card gets 10 power", skillname: "Upgrade", skillevel: 1)
        ]
        
        if Gameplay.gameplayskillarr.count >= Skills.skillaction4 {
            
            skillarr = Gameplay.gameplayskillarr.shuffled().prefix(2).map { $0 }
        } else {
            
            skillarr = allSkills.shuffled().prefix(2).map { $0 }
        }
        
        skillchoose()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        skillselection()
    }
    
    func skillselection() {
        func getSkillDescription(_ skill: SkillClass) -> String {
            if let updatedSkill = Gameplay.gameplayskillarr.first(where: { $0.name == skill.name })  {
                switch updatedSkill.name {
                case "Spell Damage":
                    return "When you use a card deals \(15 * (updatedSkill.level+1)) extra damage (Lv \(updatedSkill.level+1))"
                case "Heal Magic":
                    return "When you use a card heal \(10 * (updatedSkill.level+1)) (Lv \(updatedSkill.level+1))"
                case "Hearth of Mana":
                    let multiplier = 3 + (updatedSkill.level)
                    return "When you play a card deal and heal \(multiplier) times cards mana cost (Lv \(updatedSkill.level+1))"
                case "Different Places":
                    return "Your deck gets one random card (Lv \(updatedSkill.level+1))"
                case "Little Help":
                    return "When you play a card cost 2 or less deal extra \(30 * (updatedSkill.level+1)) damage (Lv \(updatedSkill.level+1))"
                case "Shadow Rises":
                    return "When you play a card from Dark Lord deal \(8*(updatedSkill.level+1)) heal \(8*(updatedSkill.level+1)) (Lv \(updatedSkill.level+1))"
                case "Spell Combo":
                    return "If you play 3 Wizard card deal \(50*(updatedSkill.level+1)) (Lv \(updatedSkill.level+1))"
                case "Tougher Than Ever":
                    return "When you play a card from Giants gain \(15*(updatedSkill.level+1))  Shield (Lv \(updatedSkill.level+1))"
                case "Shield Magic":
                    return "When you use a card shield \(10 * (updatedSkill.level+1)) (Lv \(updatedSkill.level+1))"
                case "Attacking Safe":
                    return "When you play a card while you have shield deal \(20 * (updatedSkill.level+1)) damage (Lv \(updatedSkill.level+1))"
                case "Excellent Deal":
                    let multiplier1 = 3 * (updatedSkill.level)
                    return "Deal damage \(multiplier1) times the number of cards you added that are not in the deck(Added:\(Gameplay.totalbuyedcards)) (Lv \(updatedSkill.level+1))"
                case "More Misery":
                    return "When you kill an enemy enemy gets \(1 * (updatedSkill.level+1))  curse (Lv \(updatedSkill.level+1))"
                case "Healing Curse":
                    return "Heal \(1 * (updatedSkill.level+1)) times of the curse damage (Lv \(updatedSkill.level+1))"
                case "Hurting More":
                    return "When you play a Hurt Card first deal \(5 * (updatedSkill.level+1)) yourself and deal \(30 * (updatedSkill.level+1)) to the enemy (Lv \(updatedSkill.level+1))"
                case "Upgrade":
                    return "When you add a card to your deck that card gets \(10 * (updatedSkill.level+1)) power (Lv \(updatedSkill.level+1))"
                default:
                    return "\(updatedSkill.description) (Lv \(updatedSkill.level))"
                }
            }
            return "\(skill.description) (Lv \(skill.level))"
        }

        if skillarr.indices.contains(0) {
            let skill1 = skillarr[0]
            Skill1.image = skill1.image
            SkillDesc1.text = getSkillDescription(skill1)
        }

        if skillarr.indices.contains(1) {
            let skill2 = skillarr[1]
            Skill2.image = skill2.image
            SkillDesc2.text = getSkillDescription(skill2)
        }
    }

    
    func skillchoose(){
        Skill1.isUserInteractionEnabled = true
        Skill2.isUserInteractionEnabled = true
        
        let firstskilltap = UITapGestureRecognizer(target: self, action: #selector(firstskillpressed))
        Skill1.addGestureRecognizer(firstskilltap)
        
        let secondskilltap = UITapGestureRecognizer(target: self, action: #selector(secondskillpressed))
        Skill2.addGestureRecognizer(secondskilltap)

    }
    
    func selectSkill(_ skill: SkillClass) {
        
        if let existingIndex = Gameplay.gameplayskillarr.firstIndex(where: { $0.name == skill.name }) {
            Gameplay.gameplayskillarr[existingIndex].level += 1
        } else {
            Gameplay.gameplayskillarr.append(skill)
        }

        if let localIndex = skillarr.firstIndex(where: { $0.name == skill.name }) {
            skillarr[localIndex].level = Gameplay.gameplayskillarr.first(where: { $0.name == skill.name })!.level
        }

        // UI güncellemesini main thread üzerinde yap
        DispatchQueue.main.async {
            self.skillselection()
        }

        if skill.name == "Different Places" {
            Gameplay.totalbuyedcards += 1
            addRandomCardToGameplayDeck()
            Gameplay.cardid += 1
        }
        if skill.name == "Hurting More"{
            Gameplay.hurt += 5
        }
        if skill.name == "Upgrade"{
            Gameplay.upgradepower += 10
        }
        


        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.navigationController?.popViewController(animated: true)
        }
    }



    @objc func firstskillpressed() {
        if skillarr.indices.contains(0) {
            selectSkill(skillarr[0])
        }
    }

    @objc func secondskillpressed() {
        if skillarr.indices.contains(1) {
            selectSkill(skillarr[1])
        }
    }

    
    
    
    
    
    @IBAction func exitbuttontapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func addRandomCardToGameplayDeck() {
        let allCards = CardDatabase.shared.carddatabase
        if let randomCard = allCards.randomElement() {
            if let gameplayVC = navigationController?.viewControllers.first(where: { $0 is Path }) as? Path {
                randomCard.power += Gameplay.upgradepower
                gameplayVC.cardarr.append(randomCard)
                
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
