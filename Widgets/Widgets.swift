//
//  Widgets.swift
//  Widgets
//
//  Created by Alejandro Martinez on 25/06/2020.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: TimelineProvider {
    
    func snapshot(with context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }
    
    func timeline(with context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    public let date: Date
}

struct PlaceholderView : View {
    var body: some View {
        WidgetsEntryView(entry: Provider.Entry(date: Date().advanced(by: 3000)))
        //        .isPlaceholder(true)

    }
}

struct WidgetsEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text(entry.date, style: .time)
            Image(systemName: "circle.fill")
                .foregroundColor(.red)
        }
        .padding()
//        .background(Color.gray)
//        .cornerRadius(100)
        .background(ContainerRelativeShape().fill(Color.gray))
    }
}

@main
struct Widgets: Widget {
    private let kind: String = "Widgets"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), placeholder: PlaceholderView(), content: { entry in
            WidgetsEntryView(entry: entry)
        })
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct Widgets_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderView()
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
