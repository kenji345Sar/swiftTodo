//
//  ContentView.swift
//  TodoApp
//
//  Created by Apple on 2024/01/21.
//

import SwiftUI


struct Task: Identifiable {
    let id = UUID()
    var title: String
    var checked: Bool
    
    init(title: String, checked: Bool) {
        self.title = title
        self.checked = checked
    }
}

struct ContentView: View {
    
    var tasks = [
        Task(title:"散歩",checked: true),
        Task(title:"料理",checked:false),
        Task(title:"筋トレ",checked: true)
    ]
    
    var body: some View {
        NavigationView{
            List{
                ForEach(tasks) { task in
                    ListRow(task:task.title,isCheck: task.checked)

                }

                Text("+").font(.title)
            }
            .navigationBarTitle(Text("Tasks"))
            .navigationBarItems(trailing: Text("Delete"))
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
