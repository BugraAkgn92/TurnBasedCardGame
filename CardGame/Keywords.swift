//
//  Keywords.swift
//  CardGame
//
//  Created by Buğra Akgün on 22.09.2025.
//

import UIKit

class Keywords:  UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var TableView: UITableView!
    var specials : [cardSpecial] = []
    var chosenspecialname = ""
    var chosenspecialimage = UIImage()
    var chosenspecialdescription = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()

        TableView.delegate = self
        TableView.dataSource = self
        
        specials.removeAll()
        
        let damagespecial = cardSpecial(cardspecialname: "Damage",cardspecialdescription: "The damage you deal to the opponent",cardspecialimage: UIImage(named: "enemypowericon")!)
        let shieldspecial = cardSpecial(cardspecialname: "Shield",cardspecialdescription: "When opponent hits first deal damage to shield",cardspecialimage: UIImage(named: "shieldicon")!)
        let cursespecial = cardSpecial(cardspecialname: "Curse",cardspecialdescription: "After you play a card deal 10 times your curse.After damage your curse decrease 3 and if you kill an enemy your curse divided by 3",cardspecialimage: UIImage(named: "curseicon")!)
        let lifestealspecial = cardSpecial(cardspecialname: "Lifesteal",cardspecialdescription: "Deal damage and heal equal of the damage",cardspecialimage: UIImage(named: "lifestealicon")!)
        let healthspecial = cardSpecial(cardspecialname: "Health", cardspecialdescription: "The resource you need to survive. If it drops to 0, the game is over.", cardspecialimage: UIImage(named: "healthicon")!)
        let manaspecial = cardSpecial(cardspecialname: "Mana", cardspecialdescription: "The resource you need to play cards cost.", cardspecialimage: UIImage(named: "manaicon")!)
        let hurtspecial = cardSpecial(cardspecialname: "Hurt", cardspecialdescription: "Deal damage amount of number to the enemy and deal 15 damage to yourself", cardspecialimage: UIImage(named:"hurticon")!)

        specials.append(damagespecial)
        specials.append(shieldspecial)
        specials.append(cursespecial)
        specials.append(lifestealspecial)
        specials.append(healthspecial)
        specials.append(manaspecial)
        specials.append(hurtspecial)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return specials.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = specials[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenspecialname = specials[indexPath.row].name
        chosenspecialimage = specials[indexPath.row].image
        chosenspecialdescription = specials[indexPath.row].description
        
        performSegue(withIdentifier: "toShowKeywords", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toShowKeywords"{
            let destinationVC = segue.destination as! ShowKeywords
            destinationVC.selectedspecialname = chosenspecialname
            destinationVC.selectedspecialimage = chosenspecialimage
            destinationVC.selectedspecialdescription = chosenspecialdescription
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
