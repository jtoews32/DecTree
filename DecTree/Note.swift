//
//  Note.swift
//  DecTree
//
//  Created by Jon Toews on 8/25/15.
//  Copyright (c) 2015 Jon Toews. All rights reserved.
//

import Foundation


@objc(Note)
class Note: CBLModel {
    @NSManaged var message: NSString
    @NSManaged var created: NSDate
    @NSManaged var checked: Bool
    

    func getNote() -> Note {
        
        let newNote = Note(forNewDocumentInDatabase: self.database!)

        return newNote
    }
    /*
    func getN () {
        
        let note = Note(forNewDocumentInDatabase: self.database!)
        
        
      //  let noteType = note.getValueOfProperty("type") as String
        
        
      //  note.setValue(noteType, ofProperty: "type")
        
        let newNote = Note(newDocumentInDatabase: self.database)
        
        let doc = self.database["some-note"]
        let note = Note(forDocument: doc)
        
        // This is the CLUMSY and INEFFICIENT way to handle dynamic typing:
        let doc = self.database["some-note"]
        var note: Note?
        let type = doc["type"] as? String;
        if type == "note" {
            note = Note(forDocument: doc)
        } else if type == "voice_note" {
            note = VoiceNote(forDocument: doc)
        } else if type == "picture_note" {
            note = PictureNote(forDocument: doc)
        } else {
            note = nil
        }
        
        
        // Toggle a note's checkbox property and save it:
        note.checked = !note.checked
        var error: NSError?
        if !note.save(&error) {
            handleError(error)
        }
        
        
    }
    */
    
    /*
    override func willSave(changedPropertyNames: NSSet!) {
        saveCount++
        lastSaveTime = NSDate()
    }
    
    
    override func propertiesToSaveForDeletion() -> [NSObject : AnyObject]! {
        var props = super.propertiesToSaveForDeletion()
        props["timestamp"] = CBLJSON.JSONObjectWithDate(NSDate())
        return props
    }
    */
}



