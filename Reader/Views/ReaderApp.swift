//
//  ReaderApp.swift
//  Reader
//
//  Created by Legolas on 2021-01-12.
//

import SwiftUI

@main
struct ReaderApp: App {
    let motionManager = MotionManager()
    
    var body: some Scene {
        WindowGroup {
            Master()
                .environmentObject(motionManager)
        }
    }
}
