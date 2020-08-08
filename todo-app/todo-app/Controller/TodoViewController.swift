//
//  TodoViewController.swift
//  todo-app
//
//  Created by Gulnara Saimassay on 8/1/20.
//  Copyright © 2020 Gulnara Saimassay. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    @IBOutlet weak var todoTableView: UITableView!
    
    var todos = Array<Todo>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        getTodos()

    }
    
    func getTodos(){
        NetworkService.shared.getTodos(onSuccess: { (todos) in
              self.todos = todos.items
                      self.todoTableView.reloadData()
        }) { (errorMessage) in
            debugPrint(errorMessage)
        }
    }
    

    @IBAction func addTodo(_ sender: Any) {
        guard let todoItem = todoTextField.text else{
            return
        }
        let todo = Todo(item: todoItem, priority: prioritySegment.selectedSegmentIndex)
        
        NetworkService.shared.addTodo(todo: todo, onSuccess: { (todos) in
            self.todoTextField.text = ""
            self.todos = todos.items
            self.todoTableView.reloadData()
        }) { (errorMessage) in
            debugPrint(errorMessage)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = todoTableView.dequeueReusableCell(withIdentifier: "todoCell") as? TodoTableViewCell{
            cell.updateCell(todo: todos[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
        
        
       }

}
