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
    
    static func deleteAlarm(alarm: Alarm){
        let realm = try! Realm()
        try! realm.write(){
            realm.delete(alarm)
        }
    }
    
    static func retrieveAlarms() -> Results<Alarm> {
        let realm = try! Realm()
        return realm.objects(Alarm)//.sorted(time as! NSDate(), ascending: true)
    }
    
}