//
//  ArtStyle.swift
//  CardGame
//
//  Created by Buğra Akgün on 10.09.2025.
//

import UIKit

class ArtStyle: UIViewController {

    @IBOutlet weak var EnlargedName: UILabel!
    @IBOutlet weak var EnlargedDescription: UILabel!
    @IBOutlet weak var EnlargedImage: UIImageView!
    @IBOutlet weak var herologos: UIImageView!
    
    var passedImage : UIImage?
    var passedtext : String?
    var passedname : String?
    var passedlogo : UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        EnlargedImage.image = passedImage
        EnlargedDescription.text = passedtext
        EnlargedName.text = passedname
        herologos.image = passedlogo

        // Do any additional setup after loading the view.
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
