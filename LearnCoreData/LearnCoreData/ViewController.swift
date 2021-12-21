//
//  ViewController.swift
//  LearnCoreData
//
//  Created by Сережа Хазов on 20.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrayNotes: [String] = ["1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.9600886703, green: 0.9261525273, blue: 0.8534681797, alpha: 1)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    private func setNoteBtnToView () {
        let createNewButton = UIButton()
        let imageForButton: UIImage? = UIImage(named: "pic1")
        createNewButton.setBackgroundImage(imageForButton, for: .normal)
//        createNewButton.setBackgroundImage(imageLiteral(resourceName: "pic1"), for: .normal)
        view.addSubview(createNewButton)
        createNewButton.addTarget(self, action: #selector(handlerCreateNewNoteButtonPressed), for: .touchUpInside)
        createNewButton.translatesAutoresizingMaskIntoConstraints = false
        createNewButton.rightAnchor.constraint(equalTo: tableView.rightAnchor, constant: -40).isActive = true
        createNewButton.bottomAnchor.constraint(equalTo: tableView.bottomAnchor, constant: -30).isActive = true
        createNewButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        createNewButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    @objc func handlerCreateNewNoteButtonPressed () {
        print ("Hello")
    }

}


extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = arrayNotes[indexPath.row]
        cell.textLabel?.textColor = #colorLiteral(red:0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
        cell.backgroundColor = #colorLiteral(red: 0.9600886703, green: 0.9261525273, blue: 0.8534681797, alpha: 1)
        cell.textLabel?.font = UIFont(name: "System", size: 20)
        return cell
    }
    
    
}
