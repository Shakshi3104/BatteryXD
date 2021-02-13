//
//  ContentView.swift
//  BatteryXDWatch Extension
//
//  Created by Satoshi on 2021/02/13.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var batteryState: BatteryState
    
    var body: some View {
        BatteryXDWatchView(batteryLevel: batteryState.batteryLevel, batteryCharging: batteryState.batteryCharging ?? false)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(BatteryState())
    }
}
