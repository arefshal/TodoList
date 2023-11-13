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
    @State private var isActive: Bool = false
    var body: some Scene {
        WindowGroup {
            if isActive {
                NavigationStack{
                    
                    ListView()
                }
                .environmentObject(listViewModel)

            }else {
                SplashScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            withAnimation {
                                self.isActive = true
                            }
                        }
                    }
            }
        }
            
    }
}
