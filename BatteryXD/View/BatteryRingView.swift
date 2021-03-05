//
//  BatteryRingView.swift
//  BatteryXD
//
//  Created by MacBook Pro on 2021/02/11.
//

import SwiftUI

struct BatteryRing: View {
    var batteryLevel: Float
    
    private let darkGreen = Color(red: 0.367, green: 0.807, blue: 0.389)
    
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
                .stroke(AngularGradient(
                    gradient: Gradient(colors: [self.darkGreen, Color.green]),
                    center: .center,
                    startAngle: .degrees(0),
                    endAngle: .degrees(360)
                ),
                    style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.green)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            
            // starting point
            Circle()
                .frame(width: 15.0, height: 15.0)
                .foregroundColor(self.darkGreen)
                .offset(y: -60)
            
            // ending point
            Circle()
                .frame(width: 15.0, height: 15.0)
                .offset(y: -60)
                .foregroundColor(batteryLevel > 0.95 ? Color.green : Color.green.opacity(0))
                .rotationEffect(Angle.degrees(360 * Double(batteryLevel)))
                
        }.frame(width: 120, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct ChargingMark: View {
    var body: some View {
        Image(systemName: "bolt.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30)
            .offset(x: 0, y: -60)
    }
}

struct BatteryRingCharging: View {
    var batteryLevel: Float
    var batteryCharging: Bool
    
    var body: some View {
        ZStack {
            BatteryRing(batteryLevel: batteryLevel)
            if batteryCharging {
                ChargingMark()
            }
        }
    }
}

struct BatteryRingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BatteryRingCharging(batteryLevel: 0.8, batteryCharging: false)
        }
    }
}
