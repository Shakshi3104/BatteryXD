//
//  BatteryXDView.swift
//  BatteryXD
//
//  Created by Satoshi on 2021/02/12.
//

import SwiftUI

// Battery XD View
struct BatteryXDView: View {
    var batteryLevel: Float
    var batteryCharging: Bool
    
    var body: some View {
        ZStack {
            BatteryRingCharging(batteryLevel: batteryLevel,
                                batteryCharging: batteryCharging)
            BatteryFace(batteryLevel: batteryLevel,
                        batteryCharging: batteryCharging)
        }
    }
}

struct BatteryXDView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryXDView(batteryLevel: 0.8, batteryCharging: true)
    }
}
