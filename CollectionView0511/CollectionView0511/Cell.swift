//
//  Cell.swift
//  CollectionView0511
//
//  Created by Сережа Хазов on 05.11.2021.
//

import UIKit

class Cell: UICollectionViewCell {
    
    @IBOutlet weak var temperetureImage: UIImageView!
    
    
    @IBOutlet weak var smileImage: UIImageView!
    
    
    func setTemperatureImage (temperatureName: String) {
        temperetureImage.image = UIImage(named: temperatureName)
    }
    
    func setSmileImage (smileName: String) {
        smileImage.image = UIImage (named: smileName)
    }
}
