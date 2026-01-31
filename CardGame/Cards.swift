//
//  Cards.swift
//  CardGame
//
//  Created by Buğra Akgün on 9.09.2025.
//

import Foundation
import UIKit

class Cards{
    var name : String
    var power : Int
    var cost : Int
    var image : UIImage
    var enlargedscp : String
    var logo : UIImage
    var price : Int
    var type : Int
    var special : Int
    var id : Int
    
    init(cardname:String ,cardpower: Int, cardcost: Int, cardimage: UIImage,carddescription: String, cardlogo: UIImage,cardprice: Int,cardtype : Int,cardspecial : Int,cardid : Int) {
        name = cardname
        image = cardimage
        power = cardpower
        cost = cardcost
        enlargedscp = carddescription
        logo = cardlogo
        price = cardprice
        type = cardtype
        special = cardspecial
        id = cardid
    }
}
