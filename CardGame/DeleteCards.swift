//
//  DeleteCards.swift
//  CardGame
//
//  Created by Buğra Akgün on 17.09.2025.
//

import UIKit

class DeleteCards: UIViewController {
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var image4: UIImageView!
    

    @IBOutlet weak var mana1: UILabel!
    
    @IBOutlet weak var mana2: UILabel!
    
    @IBOutlet weak var mana3: UILabel!
    
    @IBOutlet weak var mana4: UILabel!
    
    @IBOutlet weak var name1: UILabel!
    
    @IBOutlet weak var name2: UILabel!
    
    @IBOutlet weak var name3: UILabel!
    
    @IBOutlet weak var name4: UILabel!
    
    @IBOutlet weak var power1: UILabel!
    
    @IBOutlet weak var power2: UILabel!
    
    @IBOutlet weak var power3: UILabel!
    
    @IBOutlet weak var power4: UILabel!
    
 
    @IBOutlet weak var price1: UILabel!
    
    @IBOutlet weak var price2: UILabel!
    
    @IBOutlet weak var price3: UILabel!
    
    @IBOutlet weak var price4: UILabel!
    
    @IBOutlet weak var sell1: UIButton!
    
    @IBOutlet weak var sell2: UIButton!
    
    @IBOutlet weak var sell3: UIButton!
    
    @IBOutlet weak var sell4: UIButton!
    
    @IBOutlet weak var exitbutton: UIButton!
    
    @IBOutlet weak var deletegold: UILabel!
    
    @IBOutlet weak var specialdelete1: UIImageView!
    
    @IBOutlet weak var specialdelete2: UIImageView!
    
    @IBOutlet weak var specialdelete3: UIImageView!
    
    @IBOutlet weak var specialdelete4: UIImageView!
    
    @IBOutlet weak var priceimage1: UIImageView!
    
    
    @IBOutlet weak var priceimage2: UIImageView!
    
    @IBOutlet weak var priceimage3: UIImageView!
    
    @IBOutlet weak var priceimage4: UIImageView!
    
    var deleteCards: [Cards] = [] // Gösterilecek kartlar
        
        // MARK: - Lifecycle
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.navigationItem.hidesBackButton = true
            pickRandomCardsFromDeck()
            updateDeleteUI()
        }
        
        // MARK: - Kart Seçimi
        
        func pickRandomCardsFromDeck() {
            // Path ekranındaki kart dizisini al
            guard let pathVC = navigationController?.viewControllers.first(where: { $0 is Path }) as? Path else { return }
            
            // Path'teki tüm kartları çek
            let allCards: [Cards] = pathVC.cardarr
            
            // 4 kart seç, eksikse boş slotlarla doldur
            let selected = Array(allCards.shuffled().prefix(4))
            deleteCards = selected
            
            while deleteCards.count < 4 {
                deleteCards.append(
                    Cards(
                        cardname: "",
                        cardpower: 0,
                        cardcost: 0,
                        cardimage: UIImage(),
                        carddescription: "",
                        cardlogo: UIImage(),
                        cardprice: 0,
                        cardtype: 0,
                        cardspecial: 0,
                        cardid: 0
                    )
                )
            }
        }
        
        // MARK: - UI Güncelleme
        
        func updateDeleteUI() {
            let images = [image1, image2, image3, image4]
            let names = [name1, name2, name3, name4]
            let powers = [power1, power2, power3, power4]
            let manas = [mana1, mana2, mana3, mana4]
            let prices = [price1, price2, price3, price4]
            let specialimages = [specialdelete1, specialdelete2, specialdelete3, specialdelete4]
            let priceimages = [priceimage1, priceimage2, priceimage3, priceimage4]
            
            for i in 0..<4 {
                if i < deleteCards.count {
                    let card = deleteCards[i]
                    images[i]?.image = card.image
                    names[i]?.text = card.name
                    powers[i]?.text = "\(card.power)"
                    manas[i]?.text = "\(card.cost)"
                    prices[i]?.text = "\(card.price / 2)"
                    
                    if card.special < Gameplay.specialimagearr.count {
                        specialimages[i]?.image = Gameplay.specialimagearr[card.special].image
                    } else {
                        specialimages[i]?.image = nil
                    }
                    
                    priceimages[i]?.image = UIImage(named: "currency")
                } else {
                    images[i]?.image = nil
                    names[i]?.text = ""
                    powers[i]?.text = ""
                    manas[i]?.text = ""
                    prices[i]?.text = ""
                    specialimages[i]?.image = nil
                    priceimages[i]?.image = nil
                }
            }
            
            deletegold.text = "\(Gameplay.gold)"
        }
        
        // MARK: - Kart Satma
        
        func sellCard(at index: Int) {
            guard deleteCards.indices.contains(index) else { return }
            let cardToDelete = deleteCards[index]
            
            guard let pathVC = navigationController?.viewControllers.first(where: { $0 is Path }) as? Path else { return }
            
            // Path.cardarr'dan kartı bul ve sil
            if let cardIdx = pathVC.cardarr.firstIndex(where: { $0.name == cardToDelete.name }) {
                pathVC.cardarr.remove(at: cardIdx)
                Gameplay.gold += cardToDelete.price / 2
                deleteCards.remove(at: index)
            }
            
            updateDeleteUI()
        }





    
    
    
    @IBAction func sellbuttontap1(_ sender: Any) {
        sellCard(at: 0)
    }
    
    @IBAction func sellbuttontap2(_ sender: Any) {
        sellCard(at: 1)
    }
    
    @IBAction func sellbuttontap3(_ sender: Any) {
        sellCard(at: 2)
    }
    @IBAction func sellbuttontap4(_ sender: Any) {
        sellCard(at: 3)
    }
    
    
    @IBAction func exitbuttontapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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
