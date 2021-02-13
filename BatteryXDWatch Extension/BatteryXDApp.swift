//
//  BatteryXDApp.swift
//  BatteryXDWatch Extension
//
//  Created by Satoshi on 2021/02/13.
//

import SwiftUI

@main
struct BatteryXDApp: App {
    @Environment(\.scenePhase) private var scenePhase
    @StateObject private var batteryState = BatteryState()
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(batteryState)
            }
        }.onChange(of: scenePhase) { scene in
            switch scene  {
            case .active:
                print("scenePhase: active")
                batteryState.update()
            case .inactive:
                print("scenePhase: inactive")
            case .background:
                print("scenePhase: backgroud")
            @unknown default: break
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
