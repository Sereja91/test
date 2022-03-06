//
//  ViewController.swift
//  homework1639
//
//  Created by Сережа Хазов on 06.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textViewWithPostID: UITextView!
    @IBOutlet weak var getInformationByPostId: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewWithPostID.layer.cornerRadius = 10
        getInformationByPostId.layer.cornerRadius = 10
    
    }

    @IBAction func BtnToGetInformationByPostId(_ sender: Any) {
        self.getInformationByPostIDAlertController(title: "Enter post id", message: nil, style: .alert)
    }
    
    
    func fetchInformation (postID: String) {
        let urlString = "https://jsonplaceholder.typicode.com/comments?postId=\(postID)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                guard let dataString = String(data: data, encoding: .utf8) else { return }
                
                DispatchQueue.main.async {
                    self.textViewWithPostID.text = "\(dataString)"
                }
            }
        }
        
        task.resume()
        }
    }


