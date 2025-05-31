Notes-iOS

- ReadMe
	This project is a SwiftUI project
	CRUD project for note. (Create, Read, Update, Delete)
	Navigation between views (MainView, AddView, UpdateView, etc)
	Gesture in List Control to delete item
	
- Technology
	1) Implemented MVVC Archtecture.
		- Model
			let id = UUID()
			let title: String
			let noteCount: String
			let icon: String
			let dec: String
		
			Structure of Note's, which has id(primary key), title of note, count of note, icon image and description of note
			All fields were defined as 'string' (except 'id')		
		
		- ViewModel (Controller)
			There is 'add' function for creating new note and 'delete' function for removing the existing note
			
			func addData(title: String, dec: String) {
				notes.append(NoteCategory(title: title, noteCount: "3 notes", icon: "folder.fill", dec: dec))
			}
			
			func deleteData(at indexSet: IndexSet) {
				notes.remove(atOffsets: indexSet)
			}
	
			
		- View
			NavigationLink to go to AddView with "+" icon in header 
				 NavigationLink(destination: ShowAddNoteView(notesViewModel: notesViewModel)) {
                        Image(systemName: "plus")
                            .font(.title2)
                            .padding(8)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    } 
					
			
			List Control to show all notes with details 
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
					
	2) Navigation views
		Used NavigationLink function
	3) Implemneted touch gesture.
		used override onDelete() of list controler
		
