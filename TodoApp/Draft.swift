//
//  Draft.swift
//  TodoApp
//
//  Created by Apple on 2024/02/09.
//

import SwiftUI

struct Draft: View {
        @State var taskTitle = ""
        
        var body: some View {
            TextField("タスクを入力してください", text: $taskTitle)
        }
}

#Preview {
    Draft()
}
