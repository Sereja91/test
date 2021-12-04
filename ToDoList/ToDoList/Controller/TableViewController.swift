//
//  TableViewController.swift
//  ToDoList
//
//  Created by Сережа Хазов on 02.12.2021.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Устанавливаем количество секций

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    // MARK: - Устанавливаем количество строк в секции (соответствует количеству значений в массиве)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoTasks.count
    }

    // MARK: - Устанавливаем задачу в ячейку
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let currentTask = toDoTasks[indexPath.row]
        cell.textLabel?.text = currentTask["Name"] as? String
        
        return cell
    }
    
 
    
    // MARK: - Возможность удаления строки (задачи)
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        removeTask(at: indexPath.row)
        
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
          
        }
    }
    
    
    // MARK: - Возможность отмечать, что задача выполнена
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if changeState(at: indexPath.row) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none

    
        }
        
    }

    // MARK: - Добавление задачи
    @IBAction func addTaskBtn(_ sender: UIBarButtonItem) {
       
        let alertController = UIAlertController(title: "Создать новую задачу", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Новая задача"
        }

        
        let alertActionOne = UIAlertAction(title: "Отменить", style: .default)
        
        let alertActionTwo = UIAlertAction(title: "Создать", style: .cancel) { (alert) in
            let newTask = alertController.textFields![0].text
            addTask(nameOfTask: newTask!)
            self.tableView.reloadData()
        }
        
        alertController.addAction(alertActionOne)
        alertController.addAction(alertActionTwo)
        present(alertController, animated: true, completion: nil)
    }

}
