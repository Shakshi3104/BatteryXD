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
        VStack {
            ZStack {
                BatteryRing(batteryLevel: batteryState.batteryLevel ?? 0)
                BatteryFace(batteryLevel: batteryState.batteryLevel ?? 0, batteryCharging: batteryState.batteryCharging ?? false)
            }
            
            Text("\(Int((batteryState.batteryLevel ?? 0) * 100))%")
                .font(Font.system(.title, design: .rounded))
                .padding(.vertical)
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
