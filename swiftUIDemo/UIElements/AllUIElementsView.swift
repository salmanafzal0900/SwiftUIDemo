//
//  AllUIElementsView.swift
//  swiftUIDemo
//
//  Created by Salman Afzal on 24/04/2025.
//

import SwiftUI

struct AllUIElementsView: View {
    @State private var toggleOn = false
    @State private var sliderValue: Double = 0.5
    @State private var textFieldInput = ""
    @State private var pickerSelection = "Option 1"
    @State private var stepperValue = 0
    @State private var showingAlert = false
    @State private var date = Date()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Text")
                        .font(.title)

                    TextField("Enter text", text: $textFieldInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    SecureField("Password", text: $textFieldInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    Button("Tap Me") {
                        showingAlert = true
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Button tapped!"))
                    }
                    .padding()

                    Toggle("Toggle Switch", isOn: $toggleOn)
                        .padding(.horizontal)

                    Slider(value: $sliderValue, in: 0 ... 1)
                        .padding(.horizontal)

                    Stepper("Stepper: \(stepperValue)", value: $stepperValue)
                        .padding(.horizontal)

                    Picker("Picker", selection: $pickerSelection) {
                        Text("Option 1").tag("Option 1")
                        Text("Option 2").tag("Option 2")

                        Text("Option 3").tag("Option 3")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)

                    DatePicker("Select Date", selection: $date, displayedComponents: .date)
                        .padding(.horizontal)

                    ProgressView(value: sliderValue)
                        .padding(.horizontal)

                    HStack {
                        Image(systemName: "star.fill")
                        Text("Image + Text in HStack")
                    }
                    .padding(.horizontal)

                    Divider()
                        .padding(.horizontal)

                    NavigationLink(destination: Text("Next Screen")) {
                        Text("Go to Next Screen")
                    }
                    .padding(.horizontal)
                }
                .padding()
            }
            .navigationTitle("All SwiftUI Elements")
        }
    }
}

struct AllUIElementsView_Previews: PreviewProvider {
    static var previews: some View {
        AllUIElementsView()
    }
}
