//
//  NotesViewModel.swift
//  NotesApp
//
//  Created by Sagar Amin on 3/13/25.
//

import Foundation
import SwiftUI

class NotesViewModel: ObservableObject {
    
    @Published var notes: [NoteCategory] = []
    
    init() {

    }
    
    func addData(title: String, dec: String) {
        notes.append(NoteCategory(title: title, noteCount: "3 notes", icon: "folder.fill", dec: dec))
    }
    
    func deleteData(at indexSet: IndexSet) {
        notes.remove(atOffsets: indexSet)
    }
}
