//
//  ContentView.swift
//  Shared
//
//  Created by Satoshi on 2021/02/10.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    var body: some View {
        ZStack {
            BatteryFace(batteryLevel: 0.2, batteryCharging: false)
            BatteryRing(batteryLevel: 0.9)
        }
    }
}

struct BatteryRing: View {
    var batteryLevel: Float
    
    var body: some View {
        ZStack {
            // background
            Circle()
                .stroke(lineWidth: 15.0)
                .opacity(0.3)
                .foregroundColor(.secondary)
            
            // battery level
            Circle()
                .trim(from: 0.0, to: CGFloat(batteryLevel))
                .stroke(style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.green)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
        }.frame(width: 120, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct BatteryFace: View {
    var batteryLevel: Float
    var batteryCharging: Bool
    
    var body: some View {
        if batteryCharging || batteryLevel > 0.8 {
            BatterySmileFace()
        }
        else if batteryLevel > 0.3 {
            BatteryNormalFace()
        }
        else {
            BatterySadFace()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
//            ContentView().environment(\.colorScheme, .dark)
        }
    }
}
