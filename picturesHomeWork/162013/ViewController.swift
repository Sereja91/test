//
//  ViewController.swift
//  162013
//
//  Created by Сережа Хазов on 16.12.2021.
//

import UIKit

class ViewController: UIViewController {

    let defaults = UserDefaults.standard
    @IBOutlet weak var imageViewForTwoPictures: UIImageView!
    @IBOutlet weak var switchForTwoPictures: UISwitch!
    var switchOn: Bool = false
    @IBOutlet weak var pictureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            switchOn = defaults.bool(forKey: "switchOn")
            if switchOn == true {
                imageViewForTwoPictures.image = UIImage(named: "blackPicture")
                self.view.backgroundColor = .black
                pictureLabel.text = "Картинка № 1"
                pictureLabel.textColor = .white
            } else {
                imageViewForTwoPictures.image = UIImage(named: "whitePicture")
                self.view.backgroundColor = .lightGray
                pictureLabel.text = "Картинка № 2"
                pictureLabel.textColor = .black
                switchForTwoPictures.isOn = false
            }
        
        
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        
        if sender.isOn == true {
            switchOn = true
            defaults.set(switchOn, forKey: "switchOn")
            imageViewForTwoPictures.image = UIImage(named: "blackPicture")
            self.view.backgroundColor = .black
            pictureLabel.text = "Картинка № 1"
            pictureLabel.textColor = .white
        } else {
            switchOn = false
            defaults.set(switchOn, forKey: "switchOn")
            imageViewForTwoPictures.image = UIImage(named: "whitePicture")
            self.view.backgroundColor = .lightGray
            pictureLabel.text = "Картинка № 2"
            pictureLabel.textColor = .black
        }
    }
    
}
