//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Aref on 11/11/23.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var listViewModel : ListViewModel = ListViewModel()
        var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
