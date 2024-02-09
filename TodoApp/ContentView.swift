//
//  ContentView.swift
//  TodoApp
//
//  Created by Apple on 2024/01/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userData = UserData()
    
    var body: some View {
        NavigationView{
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

                Text("+").font(.title)
            }
            .navigationBarTitle(Text("Tasks"))
            .navigationBarItems(trailing: Text("Delete"))
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
