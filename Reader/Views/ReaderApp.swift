//
//  ReaderApp.swift
//  Reader
//
//  Created by Legolas on 2021-01-12.
//

import SwiftUI
import LocalAuthentication

@main
struct ReaderApp: App {
    let motionManager = MotionManager()
    @State var locked = true
    
    var body: some Scene {
        WindowGroup {
            Group {
                if locked {
                    Locked(authorize: authorize)
                } else {
                    Master()
                        .environmentObject(motionManager)
                }
            }
            .onAppear { authorize() }
        }
    }
    
    func authorize() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "解锁应用") { result, _ in
                if result {
                    locked = false
                }
            }
        }
    }
}
