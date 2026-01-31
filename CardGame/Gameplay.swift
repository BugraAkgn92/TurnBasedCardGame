//
//  Gameplay.swift
//  CardGame
//
//  Created by Buğra Akgün on 8.09.2025.
//

import UIKit

class Gameplay: UIViewController {
    @IBOutlet weak var testimage: UIImageView!
    
    @IBOutlet weak var EnemyName: UILabel!
    
    @IBOutlet weak var EnemyHealth: UILabel!
    
    @IBOutlet weak var MainMana: UILabel!
    
    @IBOutlet weak var mana1: UILabel!
    
    @IBOutlet weak var cardimage1: UIImageView!
    
    @IBOutlet weak var name1: UILabel!
    
    @IBOutlet weak var power1: UILabel!
    
    @IBOutlet weak var mana2: UILabel!
    
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var name2: UILabel!
    
    @IBOutlet weak var power2: UILabel!
    
    @IBOutlet weak var mana3: UILabel!
    
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var name3: UILabel!
    
    @IBOutlet weak var power3: UILabel!
    
    @IBOutlet weak var cardbackgameplay: UIImageView!
    
    @IBOutlet weak var Skill1G: UIImageView!
    
    @IBOutlet weak var Skill2G: UIImageView!
    
    @IBOutlet weak var Skill3G: UIImageView!
    
    @IBOutlet weak var Skill4G: UIImageView!
    
    @IBOutlet weak var goldgameplay: UILabel!
    
    @IBOutlet weak var playerhealth: UILabel!
    
    @IBOutlet weak var enemydamage: UILabel!
    
    @IBOutlet weak var gameplayturn: UILabel!
    
    @IBOutlet weak var gameplayhighscore: UILabel!
    
    @IBOutlet weak var shieldgameplay: UILabel!
    
    @IBOutlet weak var skillborder4: UIImageView!
    
    
    @IBOutlet weak var specialicon1: UIImageView!
    
    @IBOutlet weak var specialicon2: UIImageView!
    
    @IBOutlet weak var specialicon3: UIImageView!
    
    @IBOutlet weak var cursecounter: UILabel!
    
    @IBOutlet weak var curseicon: UIImageView!
    
    
    //code start
    var enemyarr = [Enemies]()
    var cardarr = [Cards]()
    var hand: [Cards?] = [nil, nil, nil]
    var currentEnemy : Enemies?
    var discardPile = [Cards]()
    var selectedCardImage: UIImage?
    var selectedDescription: String?
    var selectedName : String?
    var selectedlogo : UIImage?
    
    var cardbackimage: UIImage?
    
    var killedenemies : Int = 0
    
    static var gameplayskillarr: [SkillClass] = []
    
    static var gold : Int = 0
    
    static var playerhealthvar : Int = 100
    
    static var damageampenemy = 0
    
    static var healthampenemy = 0
    
    static var ampcounter = 0
    
    var turncounter = 1
    
    var turncounter10 = 10
    
    var accesiblecard : Cards?
    
    var spellcombocounter = 1
    
    static var playershield : Int = 0
    
    var isthereshield = 0
    
    static var totalbuyedcards : Int = 0
    
    var turncounter50 = 0
    
    static var specialimagearr: [cardSpecial] = []
    
    static var varcursecounter : Int = 0
    
    static var badeventdamage : Int = 0
    
    static var hurt : Int = 15
    
    static var cardid : Int = 7
    
    static var upgradepower : Int = 0
    
    static var nextenemy: Enemies?
    
    static var basemana : Int = 10
    

    
    

    
    func drawCards() {
        // Deste karıştır
        
        cardarr.shuffle()
        
        // İlk 3 kartı çek
        let drawnCards = Array(cardarr.prefix(3))
        
        if drawnCards.count > 0 {
            cardimage1.image = drawnCards[0].image
            name1.text = drawnCards[0].name
            power1.text = drawnCards[0].power.description
            mana1.text = drawnCards[0].cost.description
            specialicon1.image = Gameplay.specialimagearr[drawnCards[0].special].image
            
        }
        if drawnCards.count > 1 {
            image2.image = drawnCards[1].image
            name2.text = drawnCards[1].name
            power2.text = drawnCards[1].power.description
            mana2.text = drawnCards[1].cost.description
            specialicon2.image = Gameplay.specialimagearr[drawnCards[1].special].image
        }
        if drawnCards.count > 2 {
            image3.image = drawnCards[2].image
            name3.text = drawnCards[2].name
            power3.text = drawnCards[2].power.description
            mana3.text = drawnCards[2].cost.description
            specialicon3.image = Gameplay.specialimagearr[drawnCards[2].special].image
        }
    }
    

    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
            enemyarr.removeAll()
        
        turncounter = Path.pathturn
        
        
        
        
        
        cursecounter.text = Gameplay.varcursecounter.description
        
        Gameplay.ampcounter = Path.pathampcounter
        
        
        
        if turncounter < 40 {
                Skill4G.isUserInteractionEnabled = false
                Skill4G.alpha = 0.4
            }
        
        let savedHighScore = UserDefaults.standard.integer(forKey: "HighScore")
           gameplayhighscore.text = "High Score: \(savedHighScore)"
        
        gameplayturn.text = "Turn: \(turncounter.description)"
        
       
        
        
        
        playerhealth.text = Gameplay.playerhealthvar.description
        shieldgameplay.text = Gameplay.playershield.description
        
        
        
        

        
        goldgameplay.text = Gameplay.gold.description
        
        if let backImage = cardbackimage {
                cardbackgameplay.image = backImage
            }
        
        
        //self.navigationItem.hidesBackButton = true
        MainMana.text = Gameplay.basemana.description

        
        
        
        
        
        
        //Enemies
        let corruptedgiant = Enemies(enemyname: "Corrupted Giant", enemyhealth: 170,enemyimage : UIImage(named:"corruptedgiant")!, enemymaxhealth: 170, enemydescription: "Moment the magic penetrates the giants' bodies, they forget everything.",enemydamage: 0,enemylogo: UIImage(named: "corruptedgiantlogo")!,enemyid: 1)
        let shapeshifter = Enemies(enemyname: "Shapeshifter", enemyhealth: 160 ,enemyimage : UIImage(named:"shapeshifter")!, enemymaxhealth: 160, enemydescription: "I know you from somewhere right ?",enemydamage: 10,enemylogo: UIImage(named: "shapeshifterlogo")!,enemyid: 5)
        let kitsune = Enemies(enemyname: "Kitsune", enemyhealth: 165 ,enemyimage : UIImage(named:"kitsune")!, enemymaxhealth: 165 , enemydescription: "Welcome to my altar, you wretched little creature",enemydamage: 5,enemylogo: UIImage(named: "kitsunelogo")!,enemyid: 2)
        let deepwatercreature = Enemies(enemyname: "Deepwater Creature", enemyhealth: 158, enemyimage: UIImage(named: "deepwatercreature")!, enemymaxhealth: 158, enemydescription: "Under the seas is not safe for you", enemydamage: 12,enemylogo: UIImage(named: "deepwatercreaturelogo")!,enemyid: 4)
        let bloodthirstydwarf = Enemies(enemyname: "Bloodthirsty Dwarf", enemyhealth: 150, enemyimage: UIImage(named: "bloodthirstydwarf")!, enemymaxhealth: 150, enemydescription: "Even if you escape, the darkness will not leave you alone", enemydamage: 20,enemylogo: UIImage(named: "bloodthirstydwarflogo")!,enemyid: 3)

            enemyarr.append(corruptedgiant)
            enemyarr.append(shapeshifter)
            enemyarr.append(kitsune)
            enemyarr.append(deepwatercreature)
            enemyarr.append(bloodthirstydwarf)
        
        
        let damagespecial = cardSpecial(cardspecialname: "Damage",cardspecialdescription: "The damage you deal to the opponent",cardspecialimage: UIImage(named: "enemypowericon")!)
        let shieldspecial = cardSpecial(cardspecialname: "Shield",cardspecialdescription: "When opponent hits first deal damage to shield",cardspecialimage: UIImage(named: "shieldicon")!)
        let cursespecial = cardSpecial(cardspecialname: "Curse",cardspecialdescription: "After you play a card deal 10 times your curse.After damage your curse decrease 3 and if you kill an enemy your curse divided by 3",cardspecialimage: UIImage(named: "curseicon")!)
        let lifestealspecial = cardSpecial(cardspecialname: "Lifesteal",cardspecialdescription: "Deal damage and heal equal of the damage",cardspecialimage: UIImage(named: "lifestealicon")!)
        let hurtspecial = cardSpecial(cardspecialname: "Hurt", cardspecialdescription: "Deal damage amount of number to the enemy and deal 15 damage to yourself", cardspecialimage: UIImage(named:"hurticon")!)
        

        Gameplay.specialimagearr.append(damagespecial)
        Gameplay.specialimagearr.append(shieldspecial)
        Gameplay.specialimagearr.append(cursespecial)
        Gameplay.specialimagearr.append(lifestealspecial)
        Gameplay.specialimagearr.append(hurtspecial)
        
        
        pickenemy()
        drawInitialHand()
        enabletapgestures()
        enableLongPress()
        
                    
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateskillimages()
        goldgameplay.text = Gameplay.gold.description
        cursecounter.text = Gameplay.varcursecounter.description
        playerhealth.text = Gameplay.playerhealthvar.description
        turncounter = Path.pathturn
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        saveHighScore()
    }

    
    
    
    func saveHighScore() {
        let currentHighScore = UserDefaults.standard.integer(forKey: "HighScore")
        if turncounter > currentHighScore {
            UserDefaults.standard.set(turncounter, forKey: "HighScore")
        }
    }

    func updateskillimages() {
        
        Skill1G.image = nil
        Skill2G.image = nil
        Skill3G.image = nil
        Skill4G.image = nil

        if Gameplay.gameplayskillarr.indices.contains(0) {
            Skill1G.image = Gameplay.gameplayskillarr[0].image
        }
        if Gameplay.gameplayskillarr.indices.contains(1) {
            Skill2G.image = Gameplay.gameplayskillarr[1].image
        }
        if Gameplay.gameplayskillarr.indices.contains(2) {
            Skill3G.image = Gameplay.gameplayskillarr[2].image
        }
        if Gameplay.gameplayskillarr.indices.contains(3) && turncounter >= 40{
            Skill4G.image = Gameplay.gameplayskillarr[3].image
        }
    }

    
    
    
    
    
    func enableLongPress() {
        let longPress1 = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        longPress1.minimumPressDuration = 1.0
        cardimage1.addGestureRecognizer(longPress1)
        cardimage1.isUserInteractionEnabled = true

        let longPress2 = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        longPress2.minimumPressDuration = 1.0
        image2.addGestureRecognizer(longPress2)
        image2.isUserInteractionEnabled = true

        let longPress3 = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        longPress3.minimumPressDuration = 1.0
        image3.addGestureRecognizer(longPress3)
        image3.isUserInteractionEnabled = true
        
        let longPress4 = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        longPress4.minimumPressDuration = 1.0
        testimage.addGestureRecognizer(longPress4)
        testimage.isUserInteractionEnabled = true
        
        let longPressSkill1 = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
           longPressSkill1.minimumPressDuration = 1.0
           Skill1G.addGestureRecognizer(longPressSkill1)
           Skill1G.isUserInteractionEnabled = true

           let longPressSkill2 = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
           longPressSkill2.minimumPressDuration = 1.0
           Skill2G.addGestureRecognizer(longPressSkill2)
           Skill2G.isUserInteractionEnabled = true

           let longPressSkill3 = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
           longPressSkill3.minimumPressDuration = 1.0
           Skill3G.addGestureRecognizer(longPressSkill3)
           Skill3G.isUserInteractionEnabled = true
        
        let longPressSkill4 = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        longPressSkill4.minimumPressDuration = 1.0
        Skill4G.addGestureRecognizer(longPressSkill4)
        Skill4G.isUserInteractionEnabled = true
        
        let longPressCurse = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        longPressCurse.minimumPressDuration = 1.0
        curseicon.addGestureRecognizer(longPressCurse)
        curseicon.isUserInteractionEnabled = true
        
        
    }
    
    func getSkillDescription(_ skill: SkillClass) -> String {
        if let updatedSkill = Gameplay.gameplayskillarr.first(where: { $0.name == skill.name }) {
            switch updatedSkill.name {
            case "Spell Damage":
                return "When you use a card deals \(15 * updatedSkill.level) extra damage (Lv \(updatedSkill.level))"
            case "Heal Magic":
                return "When you use a card heal \(10 * updatedSkill.level) (Lv \(updatedSkill.level))"
            case "Hearth of Mana":
                return "When you play a card deal and heal \(3+((updatedSkill.level-1))) times cards mana cost (Lv \(updatedSkill.level))"
            case "Different Places":
                return "Your deck gets one random card (Lv \(updatedSkill.level))"
            case "Little Help":
                return "When you play a card cost 2 or less deal extra \(30 * (updatedSkill.level)) damage (Lv \(updatedSkill.level))"
            case "Shadow Rises":
                return "When you play a card from Dark Lord deal \(8*(updatedSkill.level)) heal \(8*(updatedSkill.level)) (Lv \(updatedSkill.level))"
            case "Spell Combo":
                return "If you play 3 Wizard card deal \(50*(updatedSkill.level)) (Lv \(updatedSkill.level))"
            case "Tougher Than Ever":
                return "When you play a card from Giants gain \(15*(updatedSkill.level))  Shield (Lv \(updatedSkill.level))"
            case "Shield Magic":
                return "When you use a card shield \(10 * updatedSkill.level) (Lv \(updatedSkill.level))"
            case "Attacking Safe":
                return "When you play a card while you have shield deal \(20 * (updatedSkill.level)) damage (Lv \(updatedSkill.level))"
            case "Excellent Deal":
                return "Deal damage \(3*((updatedSkill.level))) times the number of cards you added that are not in the deck(Added:\(Gameplay.totalbuyedcards)) (Lv \(updatedSkill.level))"
            case "More Misery":
                return "When you kill an enemy enemy gets \(1 * (updatedSkill.level))  curse (Lv \(updatedSkill.level))"
            case "Healing Curse":
                return "Heal \(1 * (updatedSkill.level)) times of the curse  (Lv \(updatedSkill.level))"
            case "Hurting More":
                return "When you play a Hurt Card first deal \(5 * (updatedSkill.level)) yourself and deal \(30 * (updatedSkill.level)) to the enemy (Lv \(updatedSkill.level))"
            case "Upgrade":
                return "When you add a card to your deck that card gets \(10 * (updatedSkill.level)) power (Lv \(updatedSkill.level))"
            default:
                return "\(updatedSkill.description) (Lv \(updatedSkill.level))"
            }
        }
        return "\(skill.description) (Lv \(skill.level))"
    }


    
    @objc func handleLongPress(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            
            selectedCardImage = nil
                    selectedDescription = nil
                    selectedName = nil
                    selectedlogo = nil
            
            if let pressedCard = sender.view as? UIImageView {
                
                if pressedCard == cardimage1, let card = hand[0] {
                    selectedCardImage = card.image
                    selectedDescription = card.enlargedscp
                    selectedName = card.name
                    selectedlogo = card.logo
                } else if pressedCard == image2, let card = hand[1] {
                    selectedCardImage = card.image
                    selectedDescription = card.enlargedscp
                    selectedName = card.name
                    selectedlogo = card.logo
                } else if pressedCard == image3, let card = hand[2] {
                    selectedCardImage = card.image
                    selectedDescription = card.enlargedscp
                    selectedName = card.name
                    selectedlogo = card.logo
                }
                else if pressedCard == testimage{
                    selectedName = EnemyName.text
                    selectedCardImage = testimage.image
                    selectedDescription = currentEnemy?.enlargedenemydscp
                    
                }
                else if pressedCard == Skill1G, Gameplay.gameplayskillarr.indices.contains(0) {
                    let skill = Gameplay.gameplayskillarr[0]
                    selectedCardImage = skill.image
                    selectedDescription = getSkillDescription(skill)
                    selectedName = skill.name
                }
                else if pressedCard == Skill2G, Gameplay.gameplayskillarr.indices.contains(1) {
                    let skill = Gameplay.gameplayskillarr[1]
                    selectedCardImage = skill.image
                    selectedDescription = getSkillDescription(skill)
                    selectedName = skill.name
                }
                else if pressedCard == Skill3G, Gameplay.gameplayskillarr.indices.contains(2) {
                    let skill = Gameplay.gameplayskillarr[2]
                    selectedCardImage = skill.image
                    selectedDescription = getSkillDescription(skill)
                    selectedName = skill.name
                }
                else if pressedCard == Skill4G, Gameplay.gameplayskillarr.indices.contains(3) {
                    let skill = Gameplay.gameplayskillarr[3]
                    selectedCardImage = skill.image
                    selectedDescription = getSkillDescription(skill)
                    selectedName = skill.name
                }
                else if pressedCard == curseicon{
                    selectedName = "Curse"
                    selectedDescription = "After you play a card deal 10 times your curse.After damage your curse decrease 3 and if you kill an enemy your curse divided by 3"
                    selectedCardImage = UIImage(named: "curseicon")
                }
                
                performSegue(withIdentifier: "toEnlargedImage", sender: self)
            }
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEnlargedImage" {
            if let destinationVC = segue.destination as? ArtStyle {
                destinationVC.passedImage = selectedCardImage
                destinationVC.passedtext = selectedDescription
                destinationVC.passedname = selectedName
                destinationVC.passedlogo = selectedlogo
            }
        }
    }
    
    
    func pickenemy() {
        for i in 0..<enemyarr.count {
            if enemyarr[i].id == Path.gameplayenemyid{
                Gameplay.nextenemy = enemyarr[i]
            }
        }
        if Gameplay.ampcounter>=1{
            Gameplay.damageampenemy = Gameplay.damageampenemy + (5*Gameplay.ampcounter)
            for i in 0..<enemyarr.count {
                    enemyarr[i].damage += (2*Gameplay.ampcounter)
                enemyarr[i].damage += Gameplay.badeventdamage
                enemyarr[i].maxHealth += (1*Gameplay.ampcounter)
                enemyarr[i].health += (1*Gameplay.ampcounter)
                }
        }
        if turncounter == turncounter10{
            for i in 0..<enemyarr.count {
                    enemyarr[i].damage += 5
                enemyarr[i].maxHealth += 5
                enemyarr[i].health += 5
                }
            turncounter10 += 10
            turncounter50 += 1
            
        }
        
        if turncounter50 >= 5{
            for i in 0..<enemyarr.count {
                    enemyarr[i].damage += 50
                enemyarr[i].maxHealth += 80
                enemyarr[i].health += 80
                }
            turncounter50 = 0
        }
        if let randomEnemy = Gameplay.nextenemy {
            
            currentEnemy = randomEnemy
            
            
            currentEnemy?.health = currentEnemy?.maxHealth ?? 0
            
            
            EnemyName.text = randomEnemy.name
            EnemyHealth.text = "\(randomEnemy.health)"
            testimage.image = randomEnemy.image
            enemydamage.text = randomEnemy.damage.description
        }
    }

    func updateHandUI() {
            if let card = hand[0] {
                cardimage1.image = card.image
                name1.text = card.name
                power1.text = "\(card.power)"
                mana1.text = "\(card.cost)"
                specialicon1.image = Gameplay.specialimagearr[card.special].image
            } else {
                cardimage1.image = nil
                name1.text = ""
                power1.text = ""
                mana1.text = ""
                specialicon1.image = nil
            }
            
            if let card = hand[1] {
                image2.image = card.image
                name2.text = card.name
                power2.text = "\(card.power)"
                mana2.text = "\(card.cost)"
                specialicon2.image = Gameplay.specialimagearr[card.special].image
            } else {
                image2.image = nil
                name2.text = ""
                power2.text = ""
                mana2.text = ""
                specialicon2.image = nil
            }
            
            if let card = hand[2] {
                image3.image = card.image
                name3.text = card.name
                power3.text = "\(card.power)"
                mana3.text = "\(card.cost)"
                specialicon3.image = Gameplay.specialimagearr[card.special].image
            } else {
                image3.image = nil
                name3.text = ""
                power3.text = ""
                mana3.text = ""
                specialicon3.image = nil
            }
        }
    
    func enabletapgestures(){
        cardimage1.isUserInteractionEnabled = true
                image2.isUserInteractionEnabled = true
                image3.isUserInteractionEnabled = true
                
                let tap1 = UITapGestureRecognizer(target: self, action: #selector(card1Tapped))
                cardimage1.addGestureRecognizer(tap1)
                
                let tap2 = UITapGestureRecognizer(target: self, action: #selector(card2Tapped))
                image2.addGestureRecognizer(tap2)
                
                let tap3 = UITapGestureRecognizer(target: self, action: #selector(card3Tapped))
                image3.addGestureRecognizer(tap3)
            }
            
            @objc func card1Tapped() {
                playCards(at: 0)
            }
            
            @objc func card2Tapped() {
                playCards(at: 1)
            }
            
            @objc func card3Tapped() {
                playCards(at: 2)
            }
    
    func drawInitialHand() {
            cardarr.shuffle()
            for i in 0..<3 {
                if let card = drawCardFromDeck() {
                    hand[i] = card
                }
            }
            updateHandUI()
        }
    func drawCardFromDeck() -> Cards? {
            guard !cardarr.isEmpty else { return nil }
            return cardarr.removeFirst()
        }
    
    func discardpiledraw() {
        
        cardarr = discardPile
        discardPile.removeAll()
        cardarr.shuffle()
    }
    
    func refillHand() {
        for i in 0..<hand.count {
            if hand[i] == nil {
                if let newCard = drawCardFromDeck() {
                    hand[i] = newCard
                }
            }
        }
        updateHandUI()
    }
    
    

    
    func skillenabledhealmagic(){
        for skill in Gameplay.gameplayskillarr {
            if skill.name == "Heal Magic" {
                Gameplay.playerhealthvar += 10 * skill.level
            }
        }
    }

    func skillenabledspelldamage(){
        for skill in Gameplay.gameplayskillarr {
            if skill.name == "Spell Damage" {
                currentEnemy?.health -= 15 * skill.level
            }
        }
    }
    
    func skillenabledhearthofmana() {
        guard let card = accesiblecard else { return }

        for skill in Gameplay.gameplayskillarr {
            if skill.name == "Hearth of Mana" {
                
                
                let multiplier = 3 + (skill.level - 1)
                let damage = card.cost * multiplier
                
                currentEnemy?.health -= damage
                EnemyHealth.text = currentEnemy?.health.description
                
                Gameplay.playerhealthvar += damage
                playerhealth.text = Gameplay.playerhealthvar.description
            }
        }
    }


    func skillenabledlittlehelp() {
        for skill in Gameplay.gameplayskillarr {
            if skill.name == "Little Help" {
                currentEnemy?.health -= 30 * skill.level
            }
        }
    }
    
    func skillenabledshadowrises() {
        for skill in Gameplay.gameplayskillarr {
            if skill.name == "Shadow Rises",
               let card = accesiblecard,
               card.type == 2 {
                
                currentEnemy?.health -= 8 * skill.level
                Gameplay.playerhealthvar += 8 * skill.level
            }
        }
    }
    func skillenabledspellcombo(){
        
        for skill in Gameplay.gameplayskillarr {
            if skill.name == "Spell Combo" ,let card = accesiblecard,card.type == 1{
                if spellcombocounter < 3{
                    spellcombocounter += 1
                }else{
                    currentEnemy?.health -= 50 * (skill.level)
                    spellcombocounter = 1
                }
                
            }
        }
    }
    
    func skillenabledtougherthanever(){
        for skill in Gameplay.gameplayskillarr {
            if skill.name == "Tougher Than Ever",
               let card = accesiblecard,
               card.type == 3 {
                
                Gameplay.playershield += 15 * (skill.level)
                shieldgameplay.text = Gameplay.playershield.description
            }
        }
    }
    func skillenabledshieldmagic(){
        for skill in Gameplay.gameplayskillarr {
            if skill.name == "Shield Magic" {
                Gameplay.playershield += 10 * skill.level
                shieldgameplay.text = Gameplay.playershield.description
            }
        }
    }
    func skillenabledattackingsafe(){
        for skill in Gameplay.gameplayskillarr {
            if skill.name == "Attacking Safe" {
                currentEnemy?.health -= 20 * (skill.level)
                isthereshield = 0
            }
        }

    }
    func skillenabledexcellentdeal(){
        for skill in Gameplay.gameplayskillarr {
            if skill.name == "Excellent Deal" {
                currentEnemy?.health -= (Gameplay.totalbuyedcards * 3) * (skill.level)
            }
        }
    }
    func skillenabledmoremisery(){
        for skill in Gameplay.gameplayskillarr {
            if skill.name == "More Misery" {
                Gameplay.varcursecounter += 1 * (skill.level)
                cursecounter.text = Gameplay.varcursecounter.description
            }
        }
    }
    func skillenabledhealingcurse(){
        for skill in Gameplay.gameplayskillarr {
            if skill.name == "Healing Curse" {
                Gameplay.playerhealthvar += Gameplay.varcursecounter * (1 * skill.level)
            }
        }
    }
    func skillenabledhurtingmore(){
        for skill in Gameplay.gameplayskillarr {
            if skill.name == "Hurting More" {
                if accesiblecard?.type == 5 {
                    currentEnemy?.health -= 30 * (skill.level)
                }
            }
        }

    }






    
    
    
    
    func updateturn(){
        gameplayturn.text = "Turn: \(turncounter.description)"
        
        if turncounter >= 40 {
            skillborder4.image = UIImage(named: "skillborder")
                Skill4G.isUserInteractionEnabled = true
                Skill4G.alpha = 1.0
            Skills.skillaction4 = 4
            }
    }
    
    
    func applyamp(){
        if Gameplay.ampcounter>=1{
            Gameplay.damageampenemy = Gameplay.damageampenemy + (5*Gameplay.ampcounter)
            for i in 0..<enemyarr.count {
                    enemyarr[i].damage += (5*Gameplay.ampcounter)
                enemyarr[i].damage += Gameplay.badeventdamage
                enemyarr[i].maxHealth += (2*Gameplay.ampcounter)
                enemyarr[i].health += (2*Gameplay.ampcounter)
                }
        }
        if turncounter == turncounter10{
            for i in 0..<enemyarr.count {
                    enemyarr[i].damage += 5
                enemyarr[i].maxHealth += 5
                enemyarr[i].health += 5
                }
            turncounter10 += 10
            turncounter50 += 1
            
        }
        
        if turncounter50 >= 5{
            for i in 0..<enemyarr.count {
                    enemyarr[i].damage += 50
                enemyarr[i].maxHealth += 80
                enemyarr[i].health += 80
                }
            turncounter50 = 0
        }

    }




    
    func playCards(at index: Int) {
    
        
            guard let card = hand[index] else { return }
        
        accesiblecard = card
            
        guard let currentMana = Int(MainMana.text ?? "0") else { return }
            // Mana düş
        
        if Gameplay.playershield > 0 {
            isthereshield = 1
        }
        
        if(card.cost<=currentMana){
            let newMana = currentMana - card.cost
            MainMana.text = newMana.description
        
            
                // Düşmana hasar
            if card.special == 0{
                currentEnemy?.health -= card.power
            }
            
            if Gameplay.varcursecounter > 0 {
                currentEnemy?.health -= Gameplay.varcursecounter*10
                Gameplay.varcursecounter -= 2
                cursecounter.text = Gameplay.varcursecounter.description
            }
            
            if card.special == 2{
                Gameplay.varcursecounter += card.power
                cursecounter.text = Gameplay.varcursecounter.description
            }
            if card.special == 3{
                currentEnemy?.health -= card.power
                Gameplay.playerhealthvar += card.power
                
            }
            if card.special == 4{
                currentEnemy?.health -= card.power
                Gameplay.playerhealthvar -= Gameplay.hurt
            }
            
            if card.cost <= 2 {
                skillenabledlittlehelp()
            }
            skillenabledhurtingmore()
            skillenabledspelldamage()
            skillenabledhealmagic()
            skillenabledshadowrises()
            skillenabledspellcombo()
            skillenabledhearthofmana()
            skillenabledexcellentdeal()
            if isthereshield == 1 {
                skillenabledattackingsafe()
            }
            skillenabledhealingcurse()
            
            Gameplay.basemana -= card.cost
            
            var health = currentEnemy?.health ?? 1
            
            var incomingDamage = currentEnemy?.damage ?? 0

            if Gameplay.playershield > 0 {
                if incomingDamage >= Gameplay.playershield {
                    
                    incomingDamage -= Gameplay.playershield
                    Gameplay.playershield = 0
                } else {
                    
                    Gameplay.playershield -= incomingDamage
                    incomingDamage = 0
                }
            }

            
            Gameplay.playerhealthvar -= incomingDamage
            playerhealth.text = Gameplay.playerhealthvar.description
            shieldgameplay.text = Gameplay.playershield.description
            
            skillenabledtougherthanever()
            skillenabledshieldmagic()

            
            if Gameplay.playerhealthvar <= 0 {
                saveHighScore()
                navigationController?.popViewController(animated: true)
                killedenemies = 0
            }
            
            discardPile.append(card)
            hand[index] = nil
            
            if cardarr.isEmpty && !discardPile.isEmpty {
                        discardpiledraw()
                    }
            
            if health <= 0{
                Gameplay.playerhealthvar += 60
                playerhealth.text = Gameplay.playerhealthvar.description
                if let currentGold = Int(goldgameplay.text ?? "0") {
                    let newGold = currentGold + 10
                    goldgameplay.text = "\(newGold)"
                    Gameplay.gold = newGold
                    Gameplay.ampcounter += 1
                }

                EnemyHealth.text = "0"
                
                health = 0
                Gameplay.basemana += 10
               
                
                Gameplay.varcursecounter = (Gameplay.varcursecounter)/3
                cursecounter.text = Gameplay.varcursecounter.description
                skillenabledmoremisery()
                
                
                Path.pathnumber += 1
                navigationController?.popViewController(animated: true)
                
                
                
                
                
            }
            else{
                
                EnemyHealth.text = currentEnemy?.health.description
            }
                // Kartı elden sil
            

            
            refillHand()

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



