//
//  Enemies.swift
//  CardGame
//
//  Created by Buğra Akgün on 9.09.2025.
//

import Foundation
import UIKit

class Enemies{
    var name : String
    var health : Int
    var image : UIImage
    var maxHealth : Int
    var enlargedenemydscp : String
    var damage : Int
    var logo : UIImage
    var id : Int
    
    init(enemyname : String, enemyhealth : Int, enemyimage : UIImage,enemymaxhealth : Int,enemydescription : String,enemydamage : Int,enemylogo : UIImage,enemyid : Int) {
        name = enemyname
        image = enemyimage
        health = enemyhealth
        maxHealth = enemymaxhealth
        enlargedenemydscp = enemydescription
        damage = enemydamage
        logo = enemylogo
        id = enemyid
        
    }
}
