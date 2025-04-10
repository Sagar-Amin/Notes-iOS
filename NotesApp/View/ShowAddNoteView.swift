//
//  showAddNoteView.swift
//  NotesProject
//
//  Created by Gaurav Sethi on 12/03/25.
//

import SwiftUI
struct ShowAddNoteView: View {
    @State private var title = ""
    @State private var description = ""
    @State private var showAlert = false
    
    @ObservedObject var notesViewModel: NotesViewModel  // Use shared ViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Title")) {
                    TextField("Enter title", text: $title)
                }
                Section(header: Text("Description")) {
                    TextField("Enter description", text: $description)
                }
            }
            
             Button(action: {
                 if title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
                     description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                     showAlert = true  // Show alert if fields are empty
                 } else {
                      notesViewModel.addData(title: title, dec: description)
                      dismiss()
                 }
             }, label: {
                 Text("Save")
                     .foregroundColor(.black)
                     .font(.system(size: 16))
                     .padding(.trailing, 15)
             })
        }
        .alert("Missing Fields", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Both title and description must be filled out.")
        }
    }
}

#Preview {
    // ShowAddNoteView()
}
