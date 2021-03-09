//
//  CheckIn.swift
//  Reader
//
//  Created by Legolas on 2021-02-24.
//

import SwiftUI
import MapKit
import CoreLocation

struct CheckIn: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Entity.timestamp, ascending: false)], animation: .default)
    var checkIns: FetchedResults<Entity>
    
    @StateObject var locationManager = LocationManager()
    @State var displayMode = 0
    let cloudStorage = NSUbiquitousKeyValueStore()
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    Picker(selection: $displayMode, label: Text("显示模式")) {
                        Text("精简").tag(0)
                        Text("详细").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .onChange(of: displayMode) { latestSelection in
                        cloudStorage.set(latestSelection, forKey: "displayMode")
                    }
                    ForEach(checkIns) { checkIn in
                        CheckInRow(region: MKCoordinateRegion(
                            center: CLLocationCoordinate2D(
                                latitude: checkIn.latitude,
                                longitude: checkIn.longitude
                            ),
                            span: MKCoordinateSpan(
                                latitudeDelta: 0.1,
                                longitudeDelta: 0.1
                            )
                        ), locationManager: locationManager, displayMode: $displayMode, date: displayDate(checkIn.timestamp!))
                    }
                    .onDelete(perform: deleteCheckIn)
                }
                .navigationTitle("签到")
                .toolbar {
                    Button(action: {
                        Vibration.selection.vibrate()
                        newCheckIn()
                    }) {
                        Image(systemName: "checkmark.circle.fill" )
                            .font(.system(.headline, design: .rounded))
                    }
                }
            }
        }
        .onAppear {
            displayMode = Int(cloudStorage.double(forKey: "displayMode"))
        }
    }
    
    func newCheckIn() {
        let new = Entity(context: viewContext)
        new.timestamp = Date()
        new.longitude = locationManager.region.center.longitude
        new.latitude = locationManager.region.center.latitude
        try? viewContext.save()
    }
    
    func deleteCheckIn(offsets: IndexSet) {
        offsets.map { checkIns[$0] }.forEach(viewContext.delete)
        try? viewContext.save()
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "zh_Hans") //en_US
        formatter.setLocalizedDateFormatFromTemplate("MMMMdd")
        return formatter
    }()
    
    func displayDate(_ date: Date) -> String {
        return dateFormatter.string(from: date)
    }
    
}
