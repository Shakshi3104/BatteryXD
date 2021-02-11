//
//  BatteryEntry.swift
//  BatteryXDWidgetExtension
//
//  Created by MacBook Pro on 2021/02/11.
//

import UIKit
import SwiftUI
import WidgetKit

struct BatteryEntry: TimelineEntry {
    var date: Date
    
    var batteryLevel: Float
    var batteryCharging: Bool?
    var batteryState: UIDevice.BatteryState
}

extension BatteryEntry {
    init(date: Date) {
        self.date = date
        
        UIDevice.current.isBatteryMonitoringEnabled = true
        
        self.batteryLevel = UIDevice.current.batteryLevel
        self.batteryState = UIDevice.current.batteryState
        
        switch batteryState {
        case .unplugged:
            self.batteryCharging = false
        case .charging, .full:
            self.batteryCharging = true
        case .unknown:
            self.batteryCharging = nil
        @unknown default:
            fatalError()
        }
    }
}
