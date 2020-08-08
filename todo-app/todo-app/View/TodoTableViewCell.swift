//
//  TodoTableViewCell.swift
//  todo-app
//
//  Created by Gulnara Saimassay on 8/1/20.
//  Copyright © 2020 Gulnara Saimassay. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet weak var priorityView: UIView!
    @IBOutlet weak var itemLbl: UILabel!
    
    func updateCell(todo: Todo){
        itemLbl.text = todo.item
        
        switch todo.priority {
        case 0:
            priorityView.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            break
        case 1:
            priorityView.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            break
        default:
            priorityView.backgroundColor = #colorLiteral(red: 1, green: 0.1780524552, blue: 0.2336093485, alpha: 1)
        }
    }
}
