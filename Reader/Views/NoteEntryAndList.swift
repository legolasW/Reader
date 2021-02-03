//
//  NoteEntryAndList.swift
//  Reader
//
//  Created by Legolas on 2021-02-02.
//

import SwiftUI

struct NoteEntryAndList: View {
    @StateObject var noteData = TabNoteData()
    @State var titleInput = ""
    @State var contentInput = ""
    
    var body: some View {
        VStack {
            // 存储新笔记
            VStack {
                TextField("标题", text: $titleInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("正文", text: $contentInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack {
                    Spacer()
                    Button(action: {
                        let id = UUID()
                        let newNote = Note(id: id, title: titleInput, content: contentInput)
                        noteData.notes.append(newNote)
                        noteData.saveNotes()
                        titleInput = ""
                        contentInput = ""
                    }) {
                        RoundButton(text: "储存笔记", image: "note.text.badge.plus")
                    }
                }
            }
                .padding()
                .background(Color.init(.sRGB, white: 0.9, opacity: 0.2))
                .cornerRadius(10)
                .shadow(radius: 1)
                .padding()
            
            // 读取现有笔记
            List {
                ForEach(noteData.notes) { note in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(note.title)
                            .font(.title3)
                            .bold()
                        Text(note.content)
                    }
                }
                .onDelete(perform: delete)
            }
            .listStyle(InsetGroupedListStyle())
        }
    }
    
    func delete(at offsets: IndexSet) {
        noteData.notes.remove(atOffsets: offsets)
        noteData.saveNotes()
    }
}

struct NoteEntryAndList_Previews: PreviewProvider {
    static var previews: some View {
        NoteEntryAndList()
    }
}
