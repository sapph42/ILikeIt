//
//  ItemList.swift
//  I Like It
//
//  Created by Nick Gibson on 11/7/23.
//

import SwiftUI

struct ItemList: View {
    var body: some View {
        List(items, children: \.ChildItems) { row in
            HStack {
                Text(row.Name)
            }
        }
    }
}

#Preview {
    ItemList()
}
