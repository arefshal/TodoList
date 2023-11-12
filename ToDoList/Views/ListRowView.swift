//
//  ListRowView.swift
//  ToDoList
//
//  Created by Aref on 11/11/23.
//

import SwiftUI

// Represents a single row view in the to-do list.
struct ListRowView: View {
    // Item to be displayed in this row.
    let item: ItemModel

    var body: some View {
        HStack {
            // Displays an icon indicating whether the item is completed.
            Image(systemName: item.isComplate ? "checkmark.circle" : "circle")
                // Changes the color of the icon based on completion status.
                .foregroundStyle(item.isComplate ? .green : .red)
            // Displays the title of the to-do item.
            Text(item.title)
            // Pushes content to the leading edge.
            Spacer()
        }
        // Sets the font size for the row content.
        .font(.title2)
        // Adds vertical padding to the row.
        .padding(.vertical, 8)
    }
}

// Provides a preview for the ListRowView.
struct ListRowView_Preview: PreviewProvider {
    // Sample items for previewing the view.
    static var item1 = ItemModel(title: "first item", isComplate: false)
    static var item2 = ItemModel(title: "second item", isComplate: true)

    static var previews: some View {
        // Groups two different row views for preview.
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        // Adjusts the preview layout for better visibility.
        .previewLayout(.sizeThatFits)
    }
}
