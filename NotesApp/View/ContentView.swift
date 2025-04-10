//
//  ContentView.swift
//  NotesApp
//
//  Created by Sagar Amin on 3/13/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var notesViewModel =  NotesViewModel()  // Use shared ViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                    
                    Text("Sagar")
                        .font(.title2)
                        .bold()
                    
                    Spacer()
                    
                    //                Image(systemName: "magnifyingglass")
                    //                    .font(.title2)
                    NavigationLink(destination: ShowAddNoteView(notesViewModel: notesViewModel)) {
                        Image(systemName: "plus")
                            .font(.title2)
                            .padding(8)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    } 
                }
                .padding(.horizontal)
                
                if notesViewModel.notes.count >= 1 {
                    
                    List {
                        ForEach(notesViewModel.notes.indices, id: \.self) { index in
                            
                            NavigationLink(destination: NoteDetailView(note: notesViewModel.notes[index])) {
                                HStack {
                                    Image(systemName: notesViewModel.notes[index].icon)
                                        .foregroundColor(.yellow)
                                        .font(.title2)
                                    
                                    VStack(alignment: .leading) {
                                        Text(notesViewModel.notes[index].title)
                                            .font(.headline)
                                        Text(notesViewModel.notes[index].noteCount)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    
                                }
                                .padding(.vertical, 5)
                            }
                        }
                        .onDelete(perform: DeleteNote)
                    }
                    .listStyle(PlainListStyle())
                        
                 
                    
                } else {
                    Spacer()
                    VStack {
                        Image(systemName: "doc.text.magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .foregroundColor(.blue.opacity(0.5))
                        
                        Text("Empty list!")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Click the button to write something exciting!")
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
                
               
            }
        }
    }
    
    func DeleteNote(at offsets: IndexSet) {
        notesViewModel.deleteData(at: offsets)
    }
}
#Preview {
    ContentView()
}

