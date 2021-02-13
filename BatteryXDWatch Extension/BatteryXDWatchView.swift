//
//  BatteryXDWatchView.swift
//  BatteryXDWatch Extension
//
//  Created by Satoshi on 2021/02/13.
//

import SwiftUI

struct BatteryXDWatchView: View {
    var batteryLevel: Float
    var batteryCharging: Bool
    
    var body: some View {
        BatteryXDView(batteryLevel: batteryLevel, batteryCharging: batteryCharging)
            .scaleEffect(0.8)
    }
}

struct BatteryXDWatchView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryXDWatchView(batteryLevel: 0.8, batteryCharging: true)
    }
}
