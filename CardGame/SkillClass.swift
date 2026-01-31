//
//  SkillClass.swift
//  CardGame
//
//  Created by Buğra Akgün on 12.09.2025.
//

import Foundation
import UIKit


class SkillClass {
    var image: UIImage
    var description: String
    var name: String
    var level: Int
    
    init(skillimage: UIImage, skilldescription: String,skillname: String,skillevel: Int) {
        image = skillimage
        description = skilldescription
        name = skillname
        level = skillevel
    }
}
