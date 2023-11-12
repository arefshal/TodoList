//
//  AddView.swift
//  ToDoList
//
//  Created by Aref on 11/11/23.
//

import SwiftUI

// View for adding a new item to the to-do list.
struct AddView: View {
    // Accesses the presentation mode to dismiss the view.
    @Environment(\.presentationMode) var isPresented
    // Accesses the shared ListViewModel instance from the environment.
    @EnvironmentObject var listViewModel: ListViewModel
    // State for the text field input.
    @State var textField: String = ""
    // State for the alert title.
    @State var alertTitle: String = ""
    // State to control the display of the alert.
    @State var showAlert: Bool = false

    var body: some View {
        ScrollView {
            VStack {
                // Text field for entering the new item's title.
                TextField("Type something here...", text: $textField)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                
                // Button to save the new item.
                Button(action: addNewItem, label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .foregroundColor(.white)
                        .background(Color.blue.cornerRadius(10))
                })
            }
            .padding(14)
        }
        // Sets the navigation bar title for the view.
        .navigationTitle("Add an Item 🖊️")
        // Presents an alert based on the showAlert state.
        .alert(isPresented: $showAlert, content: getAlert)
    }

    // Function to handle the addition of a new item.
    func addNewItem() {
        if textCheck() {
            listViewModel.addItem(title: textField)
            isPresented.wrappedValue.dismiss()
        }
    }

    // Checks if the text field input meets the requirements.
    func textCheck() -> Bool {
        if textField.count < 3 {
            alertTitle = "Your item needs to be at least 3 characters long 😬"
            showAlert.toggle()
            return false
        }
        return true
    }

    // Returns an alert with the current alert title.
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

// Preview provider for SwiftUI previews.
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddView()
                // Provides a ListViewModel instance to the AddView.
                .environmentObject(ListViewModel())
        }
    }
}
