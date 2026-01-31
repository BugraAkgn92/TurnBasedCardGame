//
//  ShowKeywords.swift
//  CardGame
//
//  Created by Buğra Akgün on 22.09.2025.
//

import UIKit

class ShowKeywords: UIViewController {
    @IBOutlet weak var specialname: UILabel!
    
    @IBOutlet weak var specialimage: UIImageView!
    
    @IBOutlet weak var specialdescription: UILabel!
    
    
    var selectedspecialname = ""
    var selectedspecialimage = UIImage()
    var selectedspecialdescription = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

        specialname.text = selectedspecialname
        specialimage.image = selectedspecialimage
        specialdescription.text = selectedspecialdescription
        
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
