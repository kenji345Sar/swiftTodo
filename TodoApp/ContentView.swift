//
//  ContentView.swift
//  TodoApp
//
//  Created by Apple on 2024/01/21.
//

import SwiftUI

// Task構造体: タスクのデータモデルを定義。IdentifiableとEquatableプロトコルに準拠しています。
struct Task: Identifiable, Equatable {
    let id: Int // タスクの一意識別子
    var title: String // タスクのタイトル
    var checked: Bool // タスクが完了したかどうかの状態
}

// ContentView: アプリのメインビューを定義する構造体。
struct ContentView: View {
    @State private var tasks = [ // タスクの配列を管理する状態変数。@Stateにより、UIが自動的に更新されます。
        Task(id: 1, title: "散歩", checked: true),
        Task(id: 2, title: "料理", checked: false),
        Task(id: 3, title: "筋トレ", checked: true)
    ]
    
    var body: some View {
        List { // リストビューを使用して、タスクの一覧を表示。
            ForEach($tasks) { $task in // $tasksを使用して、タスク配列の各要素に対するバインディングを生成し、ListRowに渡す。
                ListRow(taskTitle: $task.title, isChecked: $task.checked) // ListRowビューを使用して、各タスクを表示。
            }
        }
    }
}

// ListRow: リストの各行を定義するビュー。タスクのタイトルとチェック状態を表示する。
struct ListRow: View {
    @Binding var taskTitle: String // タスクタイトルのバインディング。外部からの変更を受け入れる。
    @Binding var isChecked: Bool // チェック状態のバインディング。外部からの変更を受け入れる。
    
    var body: some View {
        Toggle(isOn: $isChecked) { // トグルスイッチ。isCheckedの状態に基づいてON/OFFを切り替える。
            if isChecked {
                Text(taskTitle) // タスクがチェックされている場合、タイトルに取り消し線を表示。
                    .strikethrough()
                    .fontWeight(.ultraLight)
            } else {
                Text(taskTitle) // タスクがチェックされていない場合、通常のタイトルを表示。
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


