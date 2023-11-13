//
//  ListView.swift
//  ToDoList
//
//  Created by Aref on 11/11/23.
//

import SwiftUI

// Represents the main view for displaying the to-do list.
struct ListView: View {
    // Accesses the shared ListViewModel instance from the environment.
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty {
                Text("No Items")
            } else{
                // Creates a list to display the to-do items.
                List {
                    // Iterates over the items in the listViewModel.
                    ForEach(listViewModel.items) { item in
                        // Represents a single row in the list.
                        ListRowView(item: item)
                            // Adds a tap gesture to each row for updating item completion status.
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    // Enables swipe-to-delete functionality.
                    .onDelete(perform: listViewModel.deleteItem)
                    // Enables drag-and-drop to reorder items.
                    .onMove(perform: listViewModel.moveItem)
                }
            }
        }
        // Applies the plain list style to the list.
        .listStyle(PlainListStyle())
        // Sets the navigation bar title for the view.
        .navigationTitle("Todo List 📝")
        // Adds edit and add buttons to the navigation bar.
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: {
            // Links to the view for adding a new to-do item.
            AddView()
        }))
    }
}

// Preview provider for SwiftUI previews.
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        // Wraps ListView in a NavigationStack for the preview.
        NavigationStack {
            ListView()
                // Provides a ListViewModel instance to the ListView.
                .environmentObject(ListViewModel())
        }
    }
}
