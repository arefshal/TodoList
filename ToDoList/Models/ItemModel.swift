//
//  ItemModel.swift
//  ToDoList
//
//  Created by Aref on 11/11/23.
//

import Foundation

// Defines a struct representing an item in a ToDo list, conforming to Identifiable and Codable protocols.
struct ItemModel: Identifiable, Codable {
    // Unique identifier for each item, useful for distinguishing between items.
    let id: String
    // Title of the ToDo item.
    let title: String
    // Boolean value indicating whether the item is completed.
    let isComplate: Bool

    // Initializes a new ItemModel with optional id (auto-generated if not provided), a title, and completion status.
    init(id: String = UUID().uuidString, title: String, isComplate: Bool) {
        self.id = id
        self.title = title
        self.isComplate = isComplate
    }

    // Function to toggle the completion status of the item.
    // Returns a new ItemModel with the same id and title, but with the inverse completion status.
    func updateCompelaton() -> ItemModel {
        return ItemModel(id: id, title: title, isComplate: !isComplate)
    }
}
