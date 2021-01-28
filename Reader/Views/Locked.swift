//
//  Locked.swift
//  Reader
//
//  Created by Legolas on 2021-01-27.
//

import SwiftUI

struct Locked: View {
    let authorize: () -> ()
    
    var body: some View {
        VStack {
            Image(systemName: "lock.shield")
                .font(.system(.largeTitle, design: .rounded))
                .padding(.bottom, 50)
            Button(action: {
                authorize()
                Vibration.light.vibrate()
            }) {
                Text("轻点再次尝试解锁")
                    .bold()
            }
        }
    }
}
