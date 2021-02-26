//
//  CheckIn.swift
//  Reader
//
//  Created by Legolas on 2021-02-24.
//

import SwiftUI
import MapKit

struct CheckIn: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $locationManager.region)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct CheckIn_Previews: PreviewProvider {
    static var previews: some View {
        CheckIn()
    }
}
