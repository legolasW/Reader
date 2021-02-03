//
//  TabNoteData.swift
//  Reader
//
//  Created by Legolas on 2021-02-01.
//
import Foundation

// Model
struct Note: Codable, Identifiable {
    var id: UUID
    var title: String
    var content: String
}

// ModelView
class TabNoteData: ObservableObject {
    @Published var notes: [Note] = []
    
    static let sandboxURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let notesURL = sandboxURL.appendingPathComponent("notes.json")
    
    init() {
        notes = getNotes()
    }
    
    func getNotes() -> [Note] {
        var result: [Note] = []
        if FileManager.default.fileExists(atPath: notesURL.path) {
            let data = try! Data(contentsOf: notesURL)
            result = try! JSONDecoder().decode([Note].self, from: data)
        }
        return result
    }
    
    func saveNotes() {
        DispatchQueue.global(qos: .userInitiated).async {
            let data = try? JSONEncoder().encode(self.notes)
            try? data?.write(to: self.notesURL)
        }
    }
}
