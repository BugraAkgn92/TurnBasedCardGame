//
//  Shop.swift
//  CardGame
//
//  Created by Buğra Akgün on 13.09.2025.
//

import UIKit

class Shop: UIViewController {
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var image4: UIImageView!
    
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
    
    @IBOutlet weak var totalgold: UILabel!
    
    @IBOutlet weak var mana1: UILabel!
    
    
    @IBOutlet weak var mana2: UILabel!
    
    @IBOutlet weak var mana3: UILabel!
    
    @IBOutlet weak var mana4: UILabel!
    
    
    @IBOutlet weak var buy1: UIButton!
    
    @IBOutlet weak var buy2: UIButton!
    
    @IBOutlet weak var buy3: UIButton!
    
    @IBOutlet weak var buy4: UIButton!
    
    @IBOutlet weak var goldshop: UILabel!
    
    @IBOutlet weak var shopspecial1: UIImageView!
    
    @IBOutlet weak var shopspecial2: UIImageView!
    
    @IBOutlet weak var shopspecial3: UIImageView!
    
    @IBOutlet weak var shopspecial4: UIImageView!
    
    @IBOutlet weak var gold1: UIImageView!
    
    @IBOutlet weak var gold2: UIImageView!
    
    @IBOutlet weak var gold3: UIImageView!
    
    @IBOutlet weak var gold4: UIImageView!
    
    
    var shopCards: [Cards] = []
    
    var selectedCardImage: UIImage?
    var selectedDescription: String?
    var selectedName : String?
    var selectedlogo : UIImage?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        goldshop.text = Gameplay.gold.description
        cardsforsale()
        enableLongPress()
        
        
        
    }
    
    func cardsforsale(){
        let allCards = CardDatabase.shared.carddatabase
        shopCards.removeAll()
        
        
        let randomCard = allCards.randomElement()!
            image1.image = randomCard.image
            name1.text = randomCard.name
            power1.text = "\(randomCard.power)"
            price1.text = "\(randomCard.price)"
            mana1.text = randomCard.cost.description
        shopspecial1.image = Gameplay.specialimagearr[randomCard.special].image
        gold1.image = UIImage(named: "currency")
        
        shopCards.append(randomCard)
        
            
        let randomCard1 = allCards.randomElement()!
            
            image2.image = randomCard1.image
            name2.text = randomCard1.name
            power2.text = "\(randomCard1.power)"
            price2.text = "\(randomCard1.price)"
            mana2.text = randomCard1.cost.description
        shopspecial2.image = Gameplay.specialimagearr[randomCard1.special].image
        gold2.image = UIImage(named: "currency")
        shopCards.append(randomCard1)
            
        let randomCard2 = allCards.randomElement()!
            
            image3.image = randomCard2.image
            name3.text = randomCard2.name
            power3.text = "\(randomCard2.power)"
            price3.text = "\(randomCard2.price)"
            mana3.text = randomCard2.cost.description
        shopspecial3.image = Gameplay.specialimagearr[randomCard2.special].image
        gold3.image = UIImage(named: "currency")
        shopCards.append(randomCard2)
            
        let randomCard3 = allCards.randomElement()!
            
            image4.image = randomCard3.image
            name4.text = randomCard3.name
            power4.text = "\(randomCard3.power)"
            price4.text = "\(randomCard3.price)"
            mana4.text = randomCard3.cost.description
        shopspecial4.image = Gameplay.specialimagearr[randomCard3.special].image
        gold4.image = UIImage(named: "currency")
        shopCards.append(randomCard3)
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func updateShopUI() {
        // Önce tüm kartları boşalt
        image1.image = nil; name1.text = ""; power1.text = ""; mana1.text = "";
        image2.image = nil; name2.text = ""; power2.text = ""; mana2.text = "";
        image3.image = nil; name3.text = ""; power3.text = ""; mana3.text = "";
        image4.image = nil; name4.text = ""; power4.text = ""; mana4.text = "";
        price1.text = "";
        price2.text = "";
        price3.text = "";
        price4.text = "";
        shopspecial1.image = nil;
        shopspecial2.image = nil;
        shopspecial3.image = nil;
        shopspecial4.image = nil;
        gold1.image = nil
        gold2.image = nil
        gold3.image = nil
        gold4.image = nil
        

        
        for (index, card) in shopCards.enumerated() {
            switch index {
            case 0:
                image1.image = card.image
                name1.text = card.name
                power1.text = "\(card.power)"
                mana1.text = "\(card.cost)"
                price1.text = card.price.description
                shopspecial1.image = Gameplay.specialimagearr[card.special].image
                gold1.image = UIImage(named: "currency")
            case 1:
                image2.image = card.image
                name2.text = card.name
                power2.text = "\(card.power)"
                mana2.text = "\(card.cost)"
                price2.text = card.price.description
                shopspecial2.image = Gameplay.specialimagearr[card.special].image
                gold2.image = UIImage(named: "currency")
            case 2:
                image3.image = card.image
                name3.text = card.name
                power3.text = "\(card.power)"
                mana3.text = "\(card.cost)"
                price3.text = card.price.description
                shopspecial3.image = Gameplay.specialimagearr[card.special].image
                gold3.image = UIImage(named: "currency")
            case 3:
                image4.image = card.image
                name4.text = card.name
                power4.text = "\(card.power)"
                mana4.text = "\(card.cost)"
                price4.text = card.price.description
                shopspecial4.image = Gameplay.specialimagearr[card.special].image
                gold4.image = UIImage(named: "currency")
            default:
                break
            }
        }
    }

    
    func addCardToGameplayDeck(at index: Int) {
            guard shopCards.indices.contains(index) else { return }
            let selectedCard = shopCards[index]
        selectedCard.power += Gameplay.upgradepower
            if let gameplayVC = navigationController?.viewControllers.first(where: { $0 is Gameplay }) as? Gameplay {

                gameplayVC.cardarr.append(selectedCard)
            }
        }
    
    func buyCard(at index: Int) {
        guard shopCards.indices.contains(index) else { return }
        let card = shopCards[index]
        card.power += Gameplay.upgradepower
        if let gameplayVC = navigationController?.viewControllers.first(where: { $0 is Path }) as? Path {
            gameplayVC.cardarr.append(card)
        }
        
       
        shopCards.remove(at: index)
        
       
        updateShopUI()
    }
    
    func enableLongPress() {
        let images = [image1, image2, image3, image4]
        
        for (index, imageView) in images.enumerated() {
            let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
            longPress.minimumPressDuration = 1.0
            imageView?.addGestureRecognizer(longPress)
            imageView?.isUserInteractionEnabled = true
            imageView?.tag = index  
        }
    }

    @objc func handleLongPress(_ sender: UILongPressGestureRecognizer) {
        
        guard sender.state == .began else { return }
        guard let pressedCard = sender.view as? UIImageView else { return }
        
        let index = pressedCard.tag
        guard shopCards.indices.contains(index) else { return }
        
        let card = shopCards[index]
        selectedCardImage = card.image
        selectedDescription = card.enlargedscp
        selectedName = card.name
        selectedlogo = card.logo
        
        performSegue(withIdentifier: "toArtStyle", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toArtStyle",
           let destVC = segue.destination as? ArtStyle {
            destVC.passedImage = selectedCardImage
            destVC.passedname = selectedName
            destVC.passedtext = selectedDescription
            destVC.passedlogo = selectedlogo
        }
    }

    
    
    
    @IBAction func buy1tapped(_ sender: Any) {
        if let priceText = price1.text, let price = Int(priceText) {
                if price <= Gameplay.gold {
                    Gameplay.gold -= price
                    buyCard(at: 0)

                    
                    totalgold.text = "\(Gameplay.gold)"
                    goldshop.text = "\(Gameplay.gold)"
                    Gameplay.gold = Int(goldshop.text ?? "0") ?? 0
                    Gameplay.totalbuyedcards += 1
                    Gameplay.cardid += 1
                }
            }

        

    }
    
    
    @IBAction func buy2tapped(_ sender: Any) {
        if let priceText = price2.text, let price = Int(priceText) {
                if price <= Gameplay.gold {
                    Gameplay.gold -= price
                    buyCard(at: 1)

                
                    totalgold.text = "\(Gameplay.gold)"
                    goldshop.text = "\(Gameplay.gold)"
                    Gameplay.gold = Int(goldshop.text ?? "0") ?? 0
                    Gameplay.totalbuyedcards += 1
                    Gameplay.cardid += 1
                }
            }

    }
    
    
    @IBAction func buy3tapped(_ sender: Any) {
        if let priceText = price3.text, let price = Int(priceText) {
                if price <= Gameplay.gold {
                    Gameplay.gold -= price
                    buyCard(at: 2)

                    
                    totalgold.text = "\(Gameplay.gold)"
                    goldshop.text = "\(Gameplay.gold)"
                    Gameplay.gold = Int(goldshop.text ?? "0") ?? 0
                    Gameplay.totalbuyedcards += 1
                    Gameplay.cardid += 1
                }
            }

    }
    
    @IBAction func buy4tapped(_ sender: Any) {
        if let priceText = price4.text, let price = Int(priceText) {
                if price <= Gameplay.gold {
                    Gameplay.gold -= price
                    buyCard(at: 3)

                    
                    totalgold.text = "\(Gameplay.gold)"
                    goldshop.text = "\(Gameplay.gold)"
                    Gameplay.gold = Int(goldshop.text ?? "0") ?? 0
                    Gameplay.totalbuyedcards += 1
                    Gameplay.cardid += 1
                }
            }

    }
    
    
    
    
    
    @IBAction func exitbuttontapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
    
}
