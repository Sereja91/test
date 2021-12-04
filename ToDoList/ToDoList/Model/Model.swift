//
//  Model.swift
//  ToDoList
//
//  Created by Сережа Хазов on 02.12.2021.
//

import Foundation
import UIKit


var toDoTasks: [[String : Any]] = []

// MARK: - Метод по добавлению задачи
func addTask (nameOfTask: String, isCompleted: Bool = false) {
    toDoTasks.append(["Name": nameOfTask, "isCompleted" : isCompleted])

}



// MARK: - Метод по удалению задачи
func removeTask (at index: Int) {
    toDoTasks.remove(at: index)
    
}

// MARK: - Метод по изменению состояния выполнения задачи
func changeState(at item: Int) -> Bool {
    toDoTasks[item]["isCompleted"] = !(toDoTasks[item]["isCompleted"] as! Bool)
    
    return toDoTasks[item]["isCompleted"] as! Bool
}

