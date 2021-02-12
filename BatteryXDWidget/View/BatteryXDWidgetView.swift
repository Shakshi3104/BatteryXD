//
//  BatteryXDWidgetView.swift
//  BatteryXD
//
//  Created by MacBook Pro on 2021/02/11.
//

import SwiftUI
import WidgetKit

struct BatteryXDWidgetView: View {
    var entry: BatteryEntry
    
    var body: some View {
        BatteryXDView(batteryLevel: entry.batteryLevel, batteryCharging: entry.batteryCharging ?? false)
        .scaleEffect(0.8)
    }
}

struct BatteryXDWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryXDWidgetView(entry: BatteryEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
