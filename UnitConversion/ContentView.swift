//
//  ContentView.swift
//  UnitConversion
//
//  Created by 강민혜 on 9/28/23.
//

import SwiftUI

struct ContentView: View {
    
    enum LengthUnit: String, CaseIterable {
        case Meters = "meters"
        case KiloMeters = "kilometers"
        case Feet = "feet"
        case Yard = "yard"
        case Miles = "miles"
        
        var formalUnitLength: UnitLength {
            switch self {
            case .Meters: return UnitLength.meters
            case .KiloMeters: return UnitLength.kilometers
            case .Feet: return UnitLength.feet
            case .Yard: return UnitLength.yards
            case .Miles: return UnitLength.miles
            }
        }
    }
        
    @State private var selectedInputUnit = LengthUnit.Meters
    @State private var selectedOutputUnit = LengthUnit.Meters
    @State private var inputAmount = 0.0
    
    @FocusState private var amountIsFocused: Bool

    var convertedResult: String {
        let inputValue = Measurement(value: inputAmount, unit: selectedInputUnit.formalUnitLength)
        let convertedNumber = inputValue.converted(to: selectedOutputUnit.formalUnitLength)
        return "\(convertedNumber.value) \(selectedOutputUnit.formalUnitLength.symbol)"
    }
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section {
                    
                    Picker("Input Unit", selection: $selectedInputUnit) {
                        ForEach(LengthUnit.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    TextField("Amount", value: $inputAmount, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                } header: {
                    Text("Input Length")
                }
                
                
                Section {
                    
                    Picker("Output Unit", selection: $selectedOutputUnit) {
                        ForEach(LengthUnit.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.menu)

                } header: {
                    Text("Output Length")
                }
                
                Section {
                    
                    Text(convertedResult)
                } header: {
                    Text("Converted Length Amount")
                }
                
                
            }
            .navigationTitle("Length Conversion")
            .navigationBarTitleDisplayMode(.automatic)
            
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
