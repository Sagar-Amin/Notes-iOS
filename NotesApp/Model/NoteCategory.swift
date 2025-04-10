//
//  NoteCategory.swift
//  NotesApp
//
//  Created by Sagar Amin on 3/13/25.
//

import SwiftUI

struct NoteCategory: Identifiable ,Hashable{
    let id = UUID()
    let title: String
    let noteCount: String
    let icon: String
    let dec: String
}


