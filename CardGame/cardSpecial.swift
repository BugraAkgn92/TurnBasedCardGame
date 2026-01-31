//
//  cardSpecial.swift
//  CardGame
//
//  Created by Buğra Akgün on 21.09.2025.
//

import Foundation
import UIKit

class cardSpecial{
    var name: String
    var description: String
    var image: UIImage
    
    init(cardspecialname: String,cardspecialdescription: String,cardspecialimage: UIImage) {
        name = cardspecialname
        description = cardspecialdescription
        image = cardspecialimage
    }
}
