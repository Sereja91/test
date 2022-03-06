//
//  AlertController.swift
//  homework1639
//
//  Created by Сережа Хазов on 06.03.2022.
//

import Foundation
import UIKit

extension ViewController {
    
    func getInformationByPostIDAlertController (title: String?, message: String?, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        alertController.addTextField { textField in
            let postID = ["1","2","3"]
            textField.placeholder = postID.randomElement()
        }
        
        let getInformationByPostIDAction = UIAlertAction(title: "Get", style: .default) { _ in
            let textField = alertController.textFields?.first
            guard let postID = textField?.text else { return }
            if postID != "" {
                self.fetchInformation(postID: postID)
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(getInformationByPostIDAction)
        alertController.addAction(cancel)
        
        present(alertController, animated: true, completion: nil)
    }
        

}
