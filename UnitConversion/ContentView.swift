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
        
        var metersMultiplier: Double {
            switch self {
            case .Meters: return 1.0
            case .KiloMeters: return 1000.0
            case .Feet: return 0.3048
            case .Yard: return 0.9144
            case .Miles: return 1609.344
            }
        }
        
        var multiplyNumberToSelectedOutputUnit: Double {
            switch self {
            case .Meters: return 1.0
            case .KiloMeters: return 0.001
            case .Feet: return 3.28084
            case .Yard: return 1.093613
            case .Miles: return 0.000621
            }
        }
    }
    
    let lengthUnits: [LengthUnit] = [.Meters, .KiloMeters, .Feet, .Yard, .Miles]
    
    @State private var selectedInputUnit = LengthUnit.Meters
    @State private var selectedOutputUnit = LengthUnit.Meters
    @State private var inputAmount = 0.0
    
    @FocusState private var amountIsFocused: Bool

    var convertedResult: Double {
        
        // conversion to meters
        let convertedToMeters = inputAmount * selectedInputUnit.multiplyNumberToMeters
        
        // conversion to selected output unit
        let convertedNumber = convertedToMeters * selectedOutputUnit.multiplyNumberToSelectedOutputUnit
        
        return convertedNumber
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
                    
                    Text(convertedResult, format: .number)
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
