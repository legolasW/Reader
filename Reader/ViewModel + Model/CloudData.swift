//
//  CloudData.swift
//  Reader
//
//  Created by Legolas on 2021-02-27.
//

import CoreData

struct CloudData {
    static let shared = CloudData()
    
    let container: NSPersistentCloudKitContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "Reader")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { _,_ in })
    } 
}
























