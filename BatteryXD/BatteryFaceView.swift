//
//  BatteryFaceView.swift
//  ButteryXD
//
//  Created by Satoshi on 2021/02/10.
//

import SwiftUI

struct BatteryFaceView: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            BatteryNormalFace()
            BatterySmileFace()
            BatterySadFace()
        }
    }
}

struct BatterySmileFace: View {
    var body: some View {
        HStack {
            Circle()
                .fill(Color.primary)
                .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Circle()
                .trim(from: 0.0, to: 0.5)
                .stroke(style: StrokeStyle(lineWidth: 4.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.primary)
                .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .alignmentGuide(VerticalAlignment.center, computeValue: { dimension in
                    0.2
                })
            
            Circle()
                .fill(Color.primary)
                .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct BatterySadFace: View {
    var body: some View {
        HStack {
            Circle()
                .fill(Color.primary)
                .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            
            Circle()
                .trim(from: 0.5, to: 1.0)
                .stroke(style: StrokeStyle(lineWidth: 4.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.primary)
                .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .alignmentGuide(VerticalAlignment.center, computeValue: { dimension in
                    -1
                })
            
            
            Circle()
                .fill(Color.primary)
                .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct BatteryNormalFace: View {
    var body: some View {
        HStack {
            Circle()
                .fill(Color.primary)
                .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            
            Capsule()
                .fill(Color.primary)
                .frame(width: 11, height: 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .alignmentGuide(VerticalAlignment.center, computeValue: { dimension in
                    -1
                })
            
            
            Circle()
                .fill(Color.primary)
                .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct BatteryFace: View {
    var batteryLevel: Float
    var batteryCharging: Bool
    
    var body: some View {
        ZStack {
            if batteryCharging || batteryLevel >= 0.8 {
                BatterySmileFace()
            }
            else if batteryLevel >= 0.3 {
                BatteryNormalFace()
            }
            else {
                BatterySadFace()
            }
            
            // Charging indicate
            if batteryCharging {
                ChargingMark()
            }
        }
    }
}


struct BatteryFaceView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BatteryFaceView()
            BatteryFace(batteryLevel: 0.9, batteryCharging: false)
        }
    }
}
