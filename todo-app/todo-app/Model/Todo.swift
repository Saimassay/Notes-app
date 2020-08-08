//
//  Todo.swift
//  todo-app
//
//  Created by Gulnara Saimassay on 8/1/20.
//  Copyright © 2020 Gulnara Saimassay. All rights reserved.
//

import Foundation

struct Todos: Codable {
    let items: Array<Todo>
}

struct Todo: Codable {
    let item: String
    let priority: Int
}
