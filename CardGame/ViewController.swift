//
//  ViewController.swift
//  CardGame
//
//  Created by Buğra Akgün on 8.09.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var PlayButton: UIButton!
    
    @IBOutlet weak var SettingsButton: UIButton!
    
    @IBOutlet weak var KeywordsButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
    }
    
    @IBAction func playbuttonclicked(_ sender: Any) {
        performSegue(withIdentifier: "toDecks", sender: self)
        
    }
    @IBAction func keywordsbuttonclicked(_ sender: Any) {
        performSegue(withIdentifier: "toKeywords", sender: self)
    }
    
    



}

