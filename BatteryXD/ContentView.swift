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



struct BatteryFace: View {
    var batteryLevel: Float
    var batteryCharging: Bool
    
    var body: some View {
        ZStack {
            if batteryCharging || batteryLevel > 0.8 {
                BatterySmileFace()
            }
            else if batteryLevel > 0.3 {
                BatteryNormalFace()
            }
            else {
                BatterySadFace()
            }
            
            // Charging indicate
            if batteryCharging {
                ChargingMark()
            }
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
