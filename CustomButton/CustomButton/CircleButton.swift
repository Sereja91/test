//
//  CircleButton.swift
//  CustomButton
//
//  Created by Сережа Хазов on 10.11.2021.
//

import UIKit

@IBDesignable
class CircleButton: UIButton {

    @IBInspectable var roundButton: Bool = false {
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
    }
    
}
