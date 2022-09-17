//
//  GuessSlider.swift
//  hackzurich
//
//  Created by Rocha, Isabelly on 17.09.22.
//

import SwiftUI

struct GuessSlider: View {
    @State private var speed = 50.0
    @State private var isEditing = false

    var body: some View {
        Slider(
            value: $speed,
            in: 0...10000,
            step: 5
        ) {
            Text("Speed")
        } minimumValueLabel: {
            Text("0")
        } maximumValueLabel: {
            Text("10000kWh")
        } onEditingChanged: { editing in
            isEditing = editing
        }
        Text(String(format: "%.f kWh", speed))
            .foregroundColor(isEditing ? .red : .white)
    }
}

struct GuessSlider_Previews: PreviewProvider {
    static var previews: some View {
        GuessSlider()
    }
}
