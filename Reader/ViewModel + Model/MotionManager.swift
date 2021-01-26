//
//  MotionManager.swift
//  Reader
//
//  Created by Legolas on 2021-01-25.
//

import SwiftUI
import CoreMotion

class MotionManager: ObservableObject {
    let motionManager = CMMotionManager()

    @Published var x: CGFloat = 0
    @Published var y: CGFloat = 0
    @Published var z: CGFloat = 0
    
    init() {
        motionManager.startDeviceMotionUpdates(to: .main) { data, _ in
            guard let tilt = data?.gravity else { return }
            
            self.x = CGFloat(tilt.x)
            self.y = CGFloat(tilt.y)
            self.z = CGFloat(tilt.z)
        }
    }
}

