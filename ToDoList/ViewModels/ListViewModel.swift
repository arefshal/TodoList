//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Aref on 11/12/23.
//

import Foundation

// This class manages the list of to-do items, conforming to ObservableObject for SwiftUI data binding.
class ListViewModel: ObservableObject {
    // Published property to notify views of changes. It triggers saveItem() when items are modified.
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItem()
        }
    }

    // Key used for storing items in UserDefaults.
    let itemKeys: String = "item_list"

    // Initializes the view model and loads saved items from UserDefaults.
    init() {
        getItem()
    }

    // Retrieves and decodes the to-do items from UserDefaults.
    func getItem() {
        guard let data = UserDefaults.standard.data(forKey: itemKeys) else { return }
        let decoder = JSONDecoder()
        do {
            let savedItems = try decoder.decode([ItemModel].self, from: data)
            self.items = savedItems
        } catch {
            print("Error decoding items: \(error)")
        }
    }

    // Deletes items at specified indexes.
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }

    // Moves an item from one position to another in the list.
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }

    // Adds a new item to the list with the given title.
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isComplate: false)
        items.append(newItem)
    }

    // Updates the specified item in the list.
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompelaton()
        }
    }

    // Encodes and saves the current list of items to UserDefaults.
    func saveItem() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(encodedData, forKey: itemKeys)
        }
    }
}
