
# 📒 Notes App

A SwiftUI-based CRUD application for creating, viewing, updating, and deleting notes. It includes navigation between views and gesture support for deleting notes from a list.

---

## 🛠 Features

- SwiftUI-based UI
- MVVC Architecture
- Navigation between MainView, AddView, UpdateView, etc.
- List control with swipe-to-delete gesture
- Reusable components for clean and modular design

---

## 🧱 Architecture

### 1. MVVC Pattern

#### 🧩 Model

```swift
let id = UUID()
let title: String
let noteCount: String
let icon: String
let dec: String
```

- Represents a note category with:
  - `id` as the primary key
  - `title`: the name of the note
  - `noteCount`: number of notes
  - `icon`: system image name
  - `dec`: note description

#### ⚙️ ViewModel (Controller)

Handles note addition and deletion:

```swift
func addData(title: String, dec: String) {
    notes.append(NoteCategory(title: title, noteCount: "3 notes", icon: "folder.fill", dec: dec))
}

func deleteData(at indexSet: IndexSet) {
    notes.remove(atOffsets: indexSet)
}
```

#### 🖼 View

Navigation and display logic:

- Add new note with "+" button:

```swift
NavigationLink(destination: ShowAddNoteView(notesViewModel: notesViewModel)) {
    Image(systemName: "plus")
        .font(.title2)
        .padding(8)
        .foregroundColor(.white)
        .background(Color.blue)
        .clipShape(Circle())
        .shadow(radius: 5)
}
```

- List showing all notes:

```swift
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
```

---

## 📱 Technologies Used

- SwiftUI
- MVVC Architecture
- NavigationLink
- List Control with gesture support

---



