//
//  BatteryState.swift
//  ButteryXD
//
//  Created by Satoshi on 2021/02/10.
//

import Foundation
import UIKit
import Combine

class BatteryState: ObservableObject {
    @Published var batteryLevel: Float?
    @Published var batteryState: UIDevice.BatteryState
    @Published var batteryCharging: Bool?
    
    init() {
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
        
        print("Init battery level: \(String(describing: batteryLevel))")
        print("Init battery charging: \(String(describing: batteryCharging))")
    }
    
    private func getBatteryLevel() -> Float? {
        let state = UIDevice.current.batteryState
        
        switch state {
        case .unknown:
            return nil
        default:
            return UIDevice.current.batteryLevel
        }
    }
    
    func startBatteryMonitoring() {
        print("Start battery monitoring")
        UIDevice.current.isBatteryMonitoringEnabled = true
        
        // Observe battery level
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(batteryLevelChanged(notification:)),
            name: UIDevice.batteryLevelDidChangeNotification, object: nil)
        
        // Observe battery charging
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(batteryStateChanged(notification:)),
            name: UIDevice.batteryStateDidChangeNotification, object: nil)
    }
    
    func stopBatteryMonitoring() {
        print("Stop battery monitoring")
        UIDevice.current.isBatteryMonitoringEnabled = false
        
        // Stop observing
        NotificationCenter.default.removeObserver(
           self,
           name: UIDevice.batteryLevelDidChangeNotification, object: nil)
        NotificationCenter.default.removeObserver(
           self,
           name: UIDevice.batteryStateDidChangeNotification, object: nil)
    }
    
    @objc func batteryLevelChanged(notification: Notification) {
        UIDevice.current.isBatteryMonitoringEnabled = true
        
        self.batteryLevel = getBatteryLevel()
    }
    
    @objc func batteryStateChanged(notification: Notification) {
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
