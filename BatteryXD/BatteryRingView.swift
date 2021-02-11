//
//  BatteryRingView.swift
//  BatteryXD
//
//  Created by MacBook Pro on 2021/02/11.
//

import SwiftUI

struct BatteryRingView: View {
    var body: some View {
        ZStack {
            BatteryRing(batteryLevel: 0.98)
            ChargingMark()
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

struct ChargingMark: View {
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .center) {
                Image(systemName: "bolt.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .position(x: geometry.size.width / 2,
                              y: geometry.size.height / 2 - 60)
            }
        }
    }
}

struct BatteryRingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BatteryRingView()
        }
    }
}
