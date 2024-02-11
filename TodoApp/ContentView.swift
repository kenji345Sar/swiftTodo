//
//  ContentView.swift
//  TodoApp
//
//  Created by Apple on 2024/01/21.
//

import SwiftUI

struct Task: Identifiable, Equatable {
    let id: Int
    var title: String
    var checked: Bool
}

struct ContentView: View {
    @State private var tasks = [
        Task(id: 1, title: "散歩", checked: true),
        Task(id: 2, title: "料理", checked: false),
        Task(id: 3, title: "筋トレ", checked: true)
    ]
    
    var body: some View {
        List {
            ForEach($tasks) { $task in
                ListRow(taskTitle: $task.title, isChecked: $task.checked)
            }
        }
    }
}

struct ListRow: View {
    @Binding var taskTitle: String
    @Binding var isChecked: Bool
    
    var body: some View {
        Toggle(isOn: $isChecked) {
            if isChecked {
                Text(taskTitle)
                    .strikethrough()
                    .fontWeight(.ultraLight)
            } else {
                Text(taskTitle)
            }
        }
    }
}

#Preview {
    ContentView()
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//            ContentView()
//    }
//}


