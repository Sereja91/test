//
//  ShowImageVC.swift
//  CollectionView0511
//
//  Created by Сережа Хазов on 05.11.2021.
//

import UIKit

class ShowImageVC: UIViewController {

    
    @IBOutlet weak var currentImage: UIImageView!
    
    var imageName: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currentImage.image = UIImage (named: imageName)
    }

    func setImageName (name: String) {
        imageName = name
    }
    
}
