//
//  BatteryXDWidget.swift
//  BatteryXDWidget
//
//  Created by MacBook Pro on 2021/02/11.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> BatteryEntry {
        BatteryEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (BatteryEntry) -> ()) {
        let entry = BatteryEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entry = BatteryEntry(date: Date())
        let refresh = Calendar.current.date(byAdding: .minute, value: 15, to: Date()) ?? Date()
        let timeline = Timeline(entries: [entry], policy: .after(refresh))
        completion(timeline)
    }
}

//struct SimpleEntry: TimelineEntry {
//    let date: Date
//}
//
//struct BatteryXDWidgetEntryView : View {
//    var entry: Provider.Entry
//
//    var body: some View {
//        Text(entry.date, style: .time)
//            .foregroundColor(.primary)
//    }
//}

@main
struct BatteryXDWidget: Widget {
    let kind: String = "BatteryXDWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            BatteryXDWidgetView(entry: entry)
        }
        .configurationDisplayName("Battery XD")
        .description("Cute battery widget •ᴗ•")
    }
}

struct BatteryXDWidget_Previews: PreviewProvider {
    static var previews: some View {
        BatteryXDWidgetView(entry: BatteryEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
