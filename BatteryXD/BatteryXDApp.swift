//
//  BatteryXDApp.swift
//  BatteryXD
//
//  Created by MacBook Pro on 2021/02/11.
//

import SwiftUI

@main
struct BatteryXDApp: App {
    @Environment(\.scenePhase) private var scenePhase
    @StateObject private var batteryState = BatteryState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(batteryState)
        }
        .onChange(of: scenePhase) { scene in
            switch scene {
            case .active:
                print("scenePhase: active")
                batteryState.startBatteryMonitoring()
            case .inactive:
                print("scenePhase: inactive")
                batteryState.stopBatteryMonitoring()
            case .background:
                print("scenePhase: background")
                batteryState.stopBatteryMonitoring()
            @unknown default: break
            }
        }
    }
}
