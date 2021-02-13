//
//  ComplicationController.swift
//  BatteryXDWatch Extension
//
//  Created by Satoshi on 2021/02/13.
//

import ClockKit
import SwiftUI


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // BatteryState object
    lazy var batteryState = BatteryState()
    
    // MARK: - Complication Configuration

    func getComplicationDescriptors(handler: @escaping ([CLKComplicationDescriptor]) -> Void) {
        let descriptors = [
            CLKComplicationDescriptor(identifier: "complication", displayName: "BatteryXD",
                                      supportedFamilies: [.graphicCircular])
            // Multiple complication support can be added here with more descriptors
        ]
        
        // Call the handler with the currently supported complication descriptors
        handler(descriptors)
    }
    
    func handleSharedComplicationDescriptors(_ complicationDescriptors: [CLKComplicationDescriptor]) {
        // Do any necessary work to support these newly shared complication descriptors
    }

    // MARK: - Timeline Configuration
    
    // Define how far into the future the app can provide data.
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        // Call the handler with the last entry date you can currently provide or nil if you can't support future timelines
        handler(Date().addingTimeInterval(24.0 * 60.0 * 60.0))
    }
    
    // Define whether the complication is visible when the watch is unlocked.
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        // Call the handler with your desired behavior when the device is locked
        // If this is potentially senstive data, set .hideOnLockScreen
        handler(.showOnLockScreen)
    }

    // MARK: - Timeline Population
    
    // Return the current timeline entry.
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry
        handler(createTimelineEntry(forComplication: complication, date: Date()))
    }
    
    // Return future timeline entries.
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        var entries = [CLKComplicationTimelineEntry]()
        
        let fiveMinutes = 5.0 * 60.0
        
        var current = date.addingTimeInterval(fiveMinutes)
        let endDate = date.addingTimeInterval(24.0 * 60.0 * 60.0)
        
        while (current.compare(endDate) == .orderedAscending) && (entries.count < limit) {
            entries.append(createTimelineEntry(forComplication: complication, date: current))
            current = current.addingTimeInterval(fiveMinutes)
        }
        
        handler(entries)
    }

    // MARK: - Placeholder Templates
    
    // The system displays the placeholder in the complication selector.
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        let templete = createTemplate(forComplication: complication, date: Date())
        handler(templete)
    }
    
    // MARK: - Battery XD Templates
    
    private func createTemplate(forComplication complication: CLKComplication, date: Date) -> CLKComplicationTemplate? {
        switch complication.family {
        case .graphicCircular:
            return createGraphicCircularTemplate(forDate: date)
        default:
            return nil
        }
    }
    
    private func createGraphicCircularTemplate(forDate date: Date) -> CLKComplicationTemplate {
        let batteryLevel = batteryState.batteryLevel
        let batteryCharging = batteryState.batteryCharging
        
        let templete = CLKComplicationTemplateGraphicCircularClosedGaugeView(
            gaugeProvider: CLKSimpleGaugeProvider(
                style: .ring,
                gaugeColor: .green,
                fillFraction: batteryLevel),
            label: BatteryXDComplicationView(batteryLevel: batteryLevel, batteryCharging: batteryCharging ?? false))
        
        return templete
    }
    
    private func createTimelineEntry(forComplication complication: CLKComplication, date: Date) -> CLKComplicationTimelineEntry {
        // get complication
        let template = createTemplate(forComplication: complication, date: date)
        
        return CLKComplicationTimelineEntry(date: date, complicationTemplate: template!)
    }
}

// Battery XD Face for Complication
struct BatteryXDComplicationView: View {
    var batteryLevel: Float
    var batteryCharging: Bool
    
    var body: some View {
        BatteryFace(batteryLevel: batteryLevel, batteryCharging: batteryCharging)
            .scaleEffect(0.4)
    }
}

struct ComplicationController_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CLKComplicationTemplateGraphicCircularClosedGaugeView(gaugeProvider: CLKSimpleGaugeProvider(style: .ring, gaugeColor: .green, fillFraction: 0.8), label: BatteryXDComplicationView(batteryLevel: 0.8, batteryCharging: false)).previewContext()
        }
    }
}
