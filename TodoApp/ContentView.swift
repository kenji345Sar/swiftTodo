//
//  ContentView.swift
//  TodoApp
//
//  Created by Apple on 2024/01/21.
//

import SwiftUI


class UserData:ObservableObject {
   @Published var tasks = [
        Task(title: "散歩", checked: true),
        Task(title: "料理", checked: false),
        Task(title: "筋トレ", checked: true)
    ]
    
    @Published var isEditing: Bool = false
}

struct Task: Identifiable,Equatable {
    let id = UUID()
    var title: String
    var checked: Bool
    
    init(title: String, checked: Bool) {
        self.title = title
        self.checked = checked
    }
}


struct ContentView: View {
    
    @ObservedObject var userData = UserData()
    
    
    var body: some View {
            List{
                ForEach(userData.tasks) { task in
                    Button(action:{
                        
                        guard let index = self.userData.tasks.firstIndex(of: task) else {
                            return
                        }
                        self.userData.tasks[index].checked.toggle()
                    })
                    {
                        ListRow(task:task.title,isCheck: task.checked)
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}

//#Preview {
//    ContentView()
//}
