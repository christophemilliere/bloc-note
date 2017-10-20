//
//  NoteBook.swift
//  Bloc-note
//
//  Created by christophe milliere on 18/10/2017.
//  Copyright © 2017 christophe milliere. All rights reserved.
//

import Foundation
class NoteBook {
    
    var notes: [Note] = []
    
    func add(note: Note) {
        notes.append(note)
    }
    
    func listNotes() -> [Note] {
        return notes
    }
}
