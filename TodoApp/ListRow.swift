//
//  ListRow.swift
//  TodoApp
//
//  Created by Apple on 2024/02/11.
//

import SwiftUI

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
