//
//  ContentView.swift
//  Shared
//
//  Created by Satoshi on 2021/02/10.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @EnvironmentObject var batteryState: BatteryState
    
    var body: some View {
            ZStack {
                BatteryRing(batteryLevel: batteryState.batteryLevel ?? 0)
                BatteryFace(batteryLevel: batteryState.batteryLevel ?? 0, batteryCharging: batteryState.batteryCharging ?? false)
            }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environmentObject(BatteryState())
        }
    }
}
