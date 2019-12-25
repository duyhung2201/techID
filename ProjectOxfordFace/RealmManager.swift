//
//  RealmManager.swift
//  ProjectOxfordFace_Example
//
//  Created by Duy Hung Le on 12/25/19.
//  Copyright © 2019 David Porter. All rights reserved.
//

//import Foundation
//import Realm
//
//class RealmManager: NSObject {
//    static let shared = RealmManager()
//    let realm = try! Rlm
//    
//    
//    func printRealmUrl() {
//        print(RLMRealmConfiguration.  .defaultConfiguration.fileURL as! URL)
//
//    }
//    
//    func setDefaultRealmPath(path: String) {
//        var config = Realm.Configuration()
//        
//        // Use the default directory, but replace the filename with the username
//        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("\(path).realm")
//        
//        // Set this as the configuration used for the default Realm
//        Realm.Configuration.defaultConfiguration = config
//    }
//    
//}
