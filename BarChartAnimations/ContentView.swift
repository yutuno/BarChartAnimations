//
//  ContentView.swift
//  BarChartAnimations
//
//  Created by yuto on 2019/10/14.
//  Copyright © 2019 yutuno. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State var pickerSelectedItem = 0

    @State var dataPoints: [[CGFloat]] = [
        [50, 100, 150, 60, 90, 80, 20],
        [100, 80, 40, 150, 10, 20, 200],
        [10, 200, 60, 50, 100, 30, 150]
    ]

    var body: some View {
        ZStack {
            Color("appBackground").edgesIgnoringSafeArea(.all)

            VStack {
                Text("Hello World")
                    .font(.system(size: 34))
                    .fontWeight(.heavy)

                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 24)

                HStack(spacing: 16) {
                    BarView(value: dataPoints[pickerSelectedItem][0])
                    BarView(value: dataPoints[pickerSelectedItem][1])
                    BarView(value: dataPoints[pickerSelectedItem][2])
                    BarView(value: dataPoints[pickerSelectedItem][3])
                    BarView(value: dataPoints[pickerSelectedItem][4])
                    BarView(value: dataPoints[pickerSelectedItem][5])
                    BarView(value: dataPoints[pickerSelectedItem][6])
                }
                .padding(.vertical, 24)
                .animation(.default)
            }
        }
    }
}

struct BarView: View {

    var value: CGFloat

    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color("barBackground"))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(Color("barPrimary"))

            }
            Text("M").padding(.top, 4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
