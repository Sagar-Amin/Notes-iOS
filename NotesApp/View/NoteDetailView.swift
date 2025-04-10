//
//  NoteDetailView.swift
//  NotesProject
//
//  Created by Harjeet Singh on 12/03/25.
//

import SwiftUI

struct NoteDetailView: View {
    @State var note: NoteCategory // Selected category
    
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text(note.title)
                .font(.title2)
                .bold()
                .frame(alignment: .leading)
                .padding(.top,40)
                .padding(.horizontal,20)

            Text(note.dec)
                .font(.body)
                .foregroundColor(.gray)
                .frame(alignment: .leading)
                .padding(.horizontal,20)

            Spacer()
        }
        .padding()
        .navigationTitle("Note Details")
    }
}


#Preview {
    NoteDetailView(note: NoteCategory(title: "111", noteCount: "1", icon: "", dec: "11111"))
}
