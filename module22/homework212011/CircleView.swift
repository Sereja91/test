//
//  CircleView.swift
//  homework212011
//
//  Created by Сережа Хазов on 14.11.2021.
//

import UIKit

@IBDesignable
class CircleView: UIView {

    @IBInspectable var roundView: Bool = false {
        didSet {
            if roundView {
                layer.cornerRadius = frame.height / 2
            }
        }
    }

    @IBInspectable var blueColor: Bool = false {
        didSet {
            if blueColor {
                backgroundColor = .systemTeal
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundView {
            layer.cornerRadius = frame.height / 2
        }
        if blueColor {
            backgroundColor = .systemTeal
        }
    }
    


    
    
    
    
    
}
