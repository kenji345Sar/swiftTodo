//
//  ContentView.swift
//  TodoApp
//
//  Created by Apple on 2024/01/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var userData: UserData

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

                if self.userData.isEditing {
                    Draft()
                }
                else{
                    Button(action:{
                        self.userData.isEditing = true
                    })
                    {
                        Text("+").font(.title)
                    }
                }

            }
            .navigationBarTitle(Text("Tasks"))
            .navigationBarItems(trailing: Text("Delete"))
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
            .environmentObject(UserData())
    }
}

//#Preview {
//    ContentView()
//}
