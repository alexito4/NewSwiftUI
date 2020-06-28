//
//  ContentView.swift
//  NewSwiftUIWatch Extension
//
//  Created by Alejandro Martinez on 27/06/2020.
//

import SwiftUI
import ClockKit

struct ContentView: View {
    var body: some View {
        GaugeExample()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CLKComplicationTemplateGraphicCircularView(GaugeExample())
                    .previewContext()
    }
}

struct GaugeExample: View {
    var body: some View {
        Gauge(value: 42, in: 3...50) {
            Image(systemName: "6.square.fill")
                .foregroundColor(.green)
        } currentValueLabel: {
            Text("42")
        } minimumValueLabel: {
            Text("3")
        } maximumValueLabel: {
            Text("10")
        }
        .gaugeStyle(CircularGaugeStyle())
    }
}
