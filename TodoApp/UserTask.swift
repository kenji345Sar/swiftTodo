//
//  UserTask.swift
//  TodoApp
//
//  Created by Apple on 2024/02/11.
//

import SwiftUI

struct Task: Identifiable,Equatable {
    let id: Int
    var title: String
    var checked: Bool
    
    init(id: Int, title: String, checked: Bool) {
        self.id = id
        self.title = title
        self.checked = checked
    }
}

