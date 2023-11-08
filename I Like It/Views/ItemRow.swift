//
//  ItemRow.swift
//  I Like It
//
//  Created by Nick Gibson on 11/7/23.
//

import SwiftUI

struct ItemRow: View {
    var item: Item
    
    var body: some View {
        HStack {
            Text(item.Name)
            Spacer()
        }
    }
}

#Preview {
    ItemRow(item: items[0])
}

#Preview {
    ItemRow(item: items[1])
}

