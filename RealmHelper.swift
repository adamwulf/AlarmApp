//
//  RealmHelper.swift
//  
//
//  Created by Grace Ding on 8/10/16.
//
//

import Foundation
import RealmSwift

class RealmHelper {
    
    static func addAlarm(alarm: Alarm){
        let realm = try! Realm()
        try! realm.write(){
            realm.add(alarm)
        }
    }
    
    static func deleteNote(note: Alarm){
        let realm = try! Realm()
        try! realm.write(){
            realm.delete(note)
        }
    }
    
    static func retrieveNotes() -> Results<Alarm> {
        let realm = try! Realm()
        return realm.objects(Alarm).sorted("modificationTime", ascending: false)
    }
    
}