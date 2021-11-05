//
//  ViewController.swift
//  CollectionView0511
//
//  Created by Сережа Хазов on 05.11.2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    

    @IBOutlet weak var collectionViewOne: UICollectionView!
    
    
    @IBOutlet weak var collectionViewTwo: UICollectionView!
    
    let arrayTemperature = ["temp.blackGreen", "temp.green", "temp.red", "temp.orange", "temp.darkYellow", "temp.lightYellow"]
    
    let arraySmile = ["bad", "favorite", "hate", "nice", "notPleasant", "routine"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewOne.delegate = self
        collectionViewOne.dataSource = self
        
        collectionViewTwo.delegate = self
        collectionViewTwo.dataSource = self
    
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ShowImageVC") as? ShowImageVC else { return }
        var currentSelectedImage: String!
        
        if collectionView == collectionViewOne {
            currentSelectedImage = arrayTemperature[indexPath.row]
            vc.setImageName(name: currentSelectedImage)
        }
        
        if collectionView == collectionViewTwo {
            currentSelectedImage = arraySmile[indexPath.row]
            vc.setImageName(name: currentSelectedImage)
        }
        
        present(vc, animated: true, completion: nil)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collectionViewOne {
            return arrayTemperature.count
        }
        
        if collectionView == collectionViewTwo {
            return arraySmile.count
        }
        
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionViewOne {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellOne", for: indexPath) as? Cell {
                let imageName = arrayTemperature[indexPath.row]
                cell.setTemperatureImage(temperatureName: imageName)
                return cell
            }
        }
        if collectionView == collectionViewTwo {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTwo", for: indexPath) as? Cell {
                let imageName = arraySmile[indexPath.row]
                cell.setSmileImage(smileName: imageName)
                return cell
            }
        }
        return UICollectionViewCell()
    }

}

