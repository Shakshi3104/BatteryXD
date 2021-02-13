//
//  BatteryState.swift
//  BatteryXDWatch Extension
//
//  Created by Satoshi on 2021/02/13.
//

import Foundation
import WatchKit
import Combine

class BatteryState: ObservableObject {
    @Published var batteryLevel: Float
    @Published var batteryState: WKInterfaceDeviceBatteryState
    @Published var batteryCharging: Bool?
    
    init() {
        WKInterfaceDevice.current().isBatteryMonitoringEnabled = true
        
        self.batteryLevel = WKInterfaceDevice.current().batteryLevel
        self.batteryState = WKInterfaceDevice.current().batteryState
        
        switch batteryState {
        case .charging, .full:
            self.batteryCharging = true
        case .unplugged:
            self.batteryCharging = false
        case .unknown:
            self.batteryCharging = nil
        @unknown default:
            fatalError()
        }
        
        print("Init battery level: \(String(describing: batteryLevel))")
        print("Init battery charging: \(String(describing: batteryCharging))")
    }
    
    func update() {
        self.batteryLevel = WKInterfaceDevice.current().batteryLevel
        self.batteryState = WKInterfaceDevice.current().batteryState
        
        switch batteryState {
        case .charging, .full:
            self.batteryCharging = true
        case .unplugged:
            self.batteryCharging = false
        case .unknown:
            self.batteryCharging = nil
        @unknown default:
            fatalError()
        }
        
        print("Updated battery level: \(String(describing: batteryLevel))")
        print("Updated battery charging: \(String(describing: batteryCharging))")
    }
    
}
