//
//  ContentView.swift
//  UnitConversion
//
//  Created by 강민혜 on 9/28/23.
//

import SwiftUI

struct ContentView: View {
    
    enum LengthUnit {
        case Meters
        case KiloMeters
        case Feet
        case Yard
        case Miles
        
        var title: String {
            switch self {
            case .Meters: return "meters"
            case .KiloMeters: return "kilometers"
            case .Feet: return "feet"
            case .Yard: return "yard"
            case .Miles: return "miles"
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
        
        
        // conversion to selected output unit
        
        
        
        return 0.0
    }
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section {
                    
                    Picker("Input Unit", selection: $selectedInputUnit) {
                        ForEach(lengthUnits, id: \.self) {
                            Text($0.title)
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
                        ForEach(lengthUnits, id: \.self) {
                            Text($0.title)
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
