//
//  ContentView.swift
//  TodoApp
//
//  Created by Apple on 2024/01/21.
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


struct ContentView: View {
    
    @State private var tasks = [
        Task(id:1,title:"散歩",checked: true),
        Task(id:2,title:"料理",checked:false),
        Task(id:3,title:"筋トレ",checked: true)
    ]
    
    
    var body: some View {
            List{
                ForEach(tasks.indices, id: \.self) { index in
                    Button(action: {
                        // 直接tasksの要素を変更
                        tasks[index].checked.toggle()
                    }) {
                        ListRow(task: tasks[index].title, isCheck: tasks[index].checked)
                    }
                }
            }
 
    }
}

struct ListRow: View {
    let task: String
    var isCheck: Bool

    var body: some View {
        HStack {
            if isCheck {
                Text("☑︎")
                Text(task)
                    .strikethrough()
                    .fontWeight(.ultraLight)
            } else {
                Text("□")
                Text(task)
            }
        }
    }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//            ContentView()
//    }
//}

#Preview {
    ContentView()
}
